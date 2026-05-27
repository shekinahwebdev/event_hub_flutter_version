const express = require("express");
const { login, refresh, signUp } = require("../controllers/authControllers");

const router = express.Router();
router.post("/login", login);
router.post("/signup", signUp);
router.post("/refresh", refresh);

module.exports = router;
