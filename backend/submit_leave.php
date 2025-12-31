<?php
include 'db_connect.php';
$name = $_POST['name'];
$roll = $_POST['roll'];
$hostel = $_POST['hostel'];
$room = $_POST['room'];
$warden = $_POST['warden'];
$from = $_POST['from'];
$to = $_POST['to'];
$reason = $_POST['reason'];
$parent_contact = $_POST['parent_contact'];
$medical = isset($_FILES['medical']) ? 'uploads/' . basename($_FILES['medical']['name']) : '';
if ($medical) move_uploaded_file($_FILES['medical']['tmp_name'], $medical);

$stmt = $pdo->prepare("INSERT INTO leaves (name, roll, hostel, room, warden, leave_from, leave_to, reason, parent_contact, medical) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
if ($stmt->execute([$name, $roll, $hostel, $room, $warden, $from, $to, $reason, $parent_contact, $medical])) {
    echo 'Leave submitted';
} else {
    echo 'Error submitting';
}
?>