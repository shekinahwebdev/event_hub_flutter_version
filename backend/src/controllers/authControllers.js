const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const prisma = require("../db");

BigInt.prototype.toJSON = function () {
  return this.toString();
};

// short-lived Access Token
const buildAccessToken = (userId, email) =>
  jwt.sign({ userId, email }, process.env.JWT_SECRET, {
    expiresIn: "20m",
  });

// long-lived Refresh Token
const buildRefreshToken = (userId, email) =>
  jwt.sign({ userId, email }, process.env.REFRESH_SECRET, {
    expiresIn: "7d",
  });

// register user logic
const signUp = async (req, res) => {
  try {
    // retrieve user details from request
    const { name, email, password } = req.body;

    // check for missing user details
    if (!name || !email || !password) {
      return res
        .status(400)
        .json({ message: "email,name and password are required" });
    }

    // normalise the email
    const actualEmail = email.toLowerCase();

    // checking for existing user
    const existingUser = await prisma.users.findUnique({
      where: { email: actualEmail },
    });
    if (existingUser) {
      return res.status(409).json({ message: "User exist already!" });
    }

    // hash the password
    const hashPassword = await bcrypt.hash(password, 10);

    const user = await prisma.users.create({
      data: {
        name: name,
        email: email.toLowerCase(),
        password: hashPassword,
      },
    });

    // generate token
    const accessToken = buildAccessToken(user.id, user.email);
    const refreshToken = buildRefreshToken(user.id, user.email);

    // send refresh token in a secure HttpOnly cookie
    res.cookie("refreshToken", refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === "production",
      sameSite: "strict",
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    return res.status(201).json({
      message: "Account created successfully",
      accessToken,
      user: { id: user.id, name: user.name, email: user.email },
    });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Could not create account.", error: error.message });
  }
};

// login user logic
const login = async (req, res) => {
  try {
    // retrieve user details from request
    const { email, password } = req.body;

    // check for missing user details
    if (!email || !password) {
      return res
        .status(400)
        .json({ message: "email,name and password are required" });
    }

    // normalise the email
    const actualEmail = email.toLowerCase();

    const user = await prisma.users.findUnique({
      where: { email: actualEmail },
    });

    if (!user) {
      return res.status(401).json({ message: "Invalid email or password." });
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ message: "Invalid email or password." });
    }

    const accessToken = buildAccessToken(user.id, user.email);
    const refreshToken = buildRefreshToken(user.id, user.email);

    res.cookie("refreshToken", refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === "production",
      sameSite: "strict",
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    return res.status(200).json({
      message: "User logged in successfully",
      accessToken,
      user: { id: user.id, email: user.email },
    });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Could not login.", error: error.message });
  }
};

const refresh = async (req, res) => {
  try {
    // grab the refresh token from the parsed cookies locker
    const refreshToken = req.cookies.refreshToken;

    if (!refreshToken) {
      return res
        .status(401)
        .json({ message: "Refresh token missing. Please log in." });
    }

    jwt.verify(refreshToken, process.env.REFRESH_SECRET, (err, decoded) => {
      if (err) {
        return res
          .status(403)
          .json({ message: "Invalid or expired refresh token." });
      }

      const accessToken = buildAccessToken(decoded.userId);

      return res.status(200).json({
        accessToken,
      });
    });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Could not refresh token.", error: error.message });
  }
};

module.exports = { login, signUp, refresh };
