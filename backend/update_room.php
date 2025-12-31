<?php
include 'db_connect.php';
$room = $_POST['room'];
$status = $_POST['status'];

$stmt = $pdo->prepare("INSERT INTO rooms (room_number, status) VALUES (?, ?) ON DUPLICATE KEY UPDATE status = ?");
if ($stmt->execute([$room, $status, $status])) {
    echo 'Room updated';
} else {
    echo 'Error updating';
}
?>