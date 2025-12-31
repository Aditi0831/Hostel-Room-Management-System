<?php
require 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id'], $_POST['status'])) {
    $id = $_POST['id'];
    $status = $_POST['status'];

    try {
        $stmt = $pdo->prepare("UPDATE admissions SET status = :status WHERE id = :id");
        $stmt->execute(['status' => $status, 'id' => $id]);
        header("Location: view_applications.php");
        exit();
    } catch (PDOException $e) {
        die("Database error: " . $e->getMessage());
    }
} else {
    header("Location: view_applications.php");
    exit();
}
?>
