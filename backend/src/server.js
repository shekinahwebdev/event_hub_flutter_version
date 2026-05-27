require("dotenv").config();
const cor = require("cors");
const express = require("express");
const cookieParser = require("cookie-parser");
const { json } = require("node:stream/consumers");
const prisma = require("./db");

const port = process.env.PORT || 5003;
const app = express();

// setup middlewares
app.use(express.json());
app.use(cookieParser());

// Implement health check for endpoint
app.get("/api/health", (req, res) => {
  res.status(200).json({ message: "Server is running successfully" });
});

// Implement fallback route for missing endpoints
app.use((req, res) => {
  res.status(404).json({ message: "Route Not Found!" });
});

// create server
const server = async () => {
  try {
    if (!process.env.JWT_SECRET) {
      throw new Error("JWT is missing");
    }

    // connect database
    console.log("Connecting database..");
    await prisma.$connect();

    // run out port
    app.listen(port, () => {
      console.log(`Server is running at port ${port}`);
    });
  } catch (error) {
    console.error("Failed to start server:", error.message);
    process.exit(1);
  }
};

server();
