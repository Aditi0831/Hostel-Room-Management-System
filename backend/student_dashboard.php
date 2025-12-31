<?php
session_start();

// If user not logged in, redirect to login
if (!isset($_SESSION['username'])) {
    header("Location: studentloginpage.html");
    exit();
}

// Store username in variable
$username = $_SESSION['username'];

// Load the HTML page
include("../student dashboard.html");
?>
