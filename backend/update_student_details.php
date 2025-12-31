<?php
include 'db_connect.php';

$name = $_POST['name'];
$mother_name = $_POST['mother_name'];
$dob = $_POST['dob'];
$address = $_POST['address'];
$mother_phone = $_POST['mother_phone'];
$father_name = $_POST['father_name'];
$father_phone = $_POST['father_phone'];
$roll = $_POST['roll'];

$stmt = $pdo->prepare("INSERT INTO student_details (name, mother_name, dob, address, mother_phone, father_name, father_phone,roll) VALUES (?, ?, ?, ?, ?, ?, ?,?)");
if ($stmt->execute([$name, $mother_name, $dob, $address, $mother_phone, $father_name, $father_phone,$roll])) {
    echo 'Details updated';
} else {
    echo 'Error updating';
}
?>