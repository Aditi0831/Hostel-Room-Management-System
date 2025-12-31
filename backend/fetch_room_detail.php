<?php
require 'db_connect.php'; 

if (!isset($_GET['roll'])) {
    echo "Roll number not provided.";
    exit;
}

$roll = $_GET['roll'];

try {
    $stmt = $pdo->prepare("
        SELECT 
            s.name AS student_name, 
            s.roll AS roll_number, 
            ra.hostel_name, 
            ra.room_number, 
            ra.allocation_date
        FROM room_allocation ra
        JOIN admissions s ON ra.id = s.id
        WHERE s.roll = ?
    ");
    $stmt->execute([$roll]);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($data) {
        echo "
        <p><strong>Name:</strong> {$data['student_name']}</p>
        <p><strong>Roll Number:</strong> {$data['roll_number']}</p>
        <p><strong>Hostel Name:</strong> {$data['hostel_name']}</p>
        <p><strong>Room Number:</strong> {$data['room_number']}</p>
        <p><strong>Allotted On:</strong> {$data['allocation_date']}</p>
        ";
    } else {
        echo "No record found for this roll number.";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
