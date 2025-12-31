<?php
include 'db_connect.php';
$name = $_POST['name'];
$roll = $_POST['roll'];
$course = $_POST['course'];
$year = $_POST['year'];
$Gender = $_POST['Gender'];
$address = $_POST['address'];
$parent_name = $_POST['parent_name'];
$contact = $_POST['contact'];

// Files
$medical = isset($_FILES['medical']) ? 'uploads/' . basename($_FILES['medical']['name']) : '';
if ($medical) move_uploaded_file($_FILES['medical']['tmp_name'], $medical);
$affidavit = isset($_FILES['affidavit']) ? 'uploads/' . basename($_FILES['affidavit']['name']) : '';
if ($affidavit) move_uploaded_file($_FILES['affidavit']['tmp_name'], $affidavit);

$stmt = $pdo->prepare("INSERT INTO admissions (name, roll, course, year,Gender, address, parent_name, contact, medical, affidavit) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
if ($stmt->execute([$name, $roll, $course, $year,$Gender, $address, $parent_name, $contact, $medical, $affidavit])) {
    echo 'Admission submitted';
} else {
    echo 'Error submitting';
}
?>