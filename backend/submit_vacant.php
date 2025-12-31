<?php
include 'db_connect.php';
$name = $_POST['name'];
$roll = $_POST['roll'];
$current_room = $_POST['current_room'];
$hostel = $_POST['hostel'];
$reason = $_POST['reason'];
$date = $_POST['date'];
$transfer = $_POST['transfer'];
$remarks = $_POST['remarks'];
$new_room = $_POST['new_room'];

$stmt = $pdo->prepare("INSERT INTO vacants (name, roll, current_room, hostel, reason, vacate_date, transfer, remarks,new_room) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)");
if ($stmt->execute([$name, $roll, $current_room, $hostel, $reason, $date, $transfer, $remarks,$new_room])) {
    echo 'Request submitted';
} else {
    echo 'Error submitting';
}
?>