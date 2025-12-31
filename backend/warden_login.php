<?php
include 'db_connect.php';
$username = $_POST['username'];
$password = $_POST['password'];

$stmt = $pdo->prepare("SELECT password FROM wardens WHERE username = ?");
$stmt->execute([$username]);
$user = $stmt->fetch();

if ($user && password_verify($password, $user['password'])) {
    echo 'Success';
} else {
    echo 'Invalid credentials';
}
?>