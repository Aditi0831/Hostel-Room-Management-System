<?php
include 'db_connect.php';
$name = $_POST['name'];
$roll = $_POST['roll'];
$room = $_POST['room'];
$hostel = $_POST['hostel'];
$type = $_POST['type'];
$description = $_POST['description'];
// Handle file upload if present
if (isset($_FILES['proof']) && $_FILES['proof']['error'] == 0) {
    $proof = 'uploads/' . basename($_FILES['proof']['name']);
    move_uploaded_file($_FILES['proof']['tmp_name'], $proof);
} else {
    $proof = '';
}

$stmt = $pdo->prepare("INSERT INTO complaints (name, roll, room, hostel, type, description, proof) VALUES (?, ?, ?, ?, ?, ?, ?)");
if ($stmt->execute([$name, $roll, $room, $hostel, $type, $description, $proof])) {
    echo 'Complaint submitted';
} else {
    echo 'Error submitting';
}
?>