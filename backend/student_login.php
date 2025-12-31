<?php
session_start();
require 'db_connect.php'; // This file should contain your PDO connection setup

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = trim($_POST['username'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if (empty($username) || empty($password)) {
        echo "<script>alert('Please enter both username and password'); window.location.href='studentloginpage.html';</script>";
        exit;
    }

    try {
        // Fetch the student record by username
        $stmt = $pdo->prepare("SELECT * FROM students WHERE username = :username LIMIT 1");
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        $student = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($student) {
            // Verify the password (since it's hashed in DB)
            if (password_verify($password, $student['password'])) {
                $_SESSION['username'] = $student['username'];
                $_SESSION['email'] = $student['email'];
                $_SESSION['id'] = $student['id'];

                header("Location:student_dashboard.php");
                exit;
            } else {
                echo "<script>alert('Invalid username or password'); window.location.href='studentloginpage.html';</script>";
                exit;
            }
        } else {
            echo "<script>alert('Invalid username or password'); window.location.href='studentloginpage.html';</script>";
            exit;
        }

    } catch (PDOException $e) {
        error_log("Database error: " . $e->getMessage());
        echo "<script>alert('Database error occurred'); window.location.href='studentloginpage.html';</script>";
        exit;
    }
} else {
    header("Location:studentloginpage.html");
    exit;
}
?>
