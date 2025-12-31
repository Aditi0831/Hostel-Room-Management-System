<?php
include 'db_connect.php';

$id = $_POST['id'];
$status = $_POST['status']; // 1 or 2

$stmt = $pdo->prepare("UPDATE leaves SET approved = ? WHERE id = ?");
if ($stmt->execute([$status, $id])) {
    if ($status == 1) {
        echo "Leave approved successfully!";
    } else {
        echo "Leave rejected successfully!";
    }
} else {
    echo "Error updating leave status.";
}
?>

