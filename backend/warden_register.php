<?php
include 'db_connect.php';
$username = $_POST['username'];
$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);

$stmt = $pdo->prepare("INSERT INTO wardens (username, email, password) VALUES (?, ?, ?)");
if ($stmt->execute([$username, $email, $password])) {
    echo 'Registration successful';
} else {
    echo 'Error registering';
}
?>