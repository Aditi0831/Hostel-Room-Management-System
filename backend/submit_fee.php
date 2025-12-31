<?php
include 'db_connect.php';
$name = $_POST['name'];
$roll = $_POST['roll'];
$room = $_POST['room'];
$email = $_POST['email'];
$amount = $_POST['amount'];
$month = $_POST['month'];
$method = $_POST['method'];
$notes = $_POST['notes'];
// Upload receipt
if (isset($_FILES['receipt']) && $_FILES['receipt']['error'] == 0) {
    $receipt = 'uploads/' . basename($_FILES['receipt']['name']);
    move_uploaded_file($_FILES['receipt']['tmp_name'], $receipt);
} else {
    $receipt = '';
}

$stmt = $pdo->prepare("INSERT INTO fees (name, roll, room, email, amount, month, method, receipt, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
if ($stmt->execute([$name, $roll, $room, $email, $amount, $month, $method, $receipt, $notes])) {
    echo 'Fee submitted';
} else {
    echo 'Error submitting';
}
?>