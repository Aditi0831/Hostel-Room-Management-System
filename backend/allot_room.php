<?php
include 'db_connect.php';
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $roll_number = $_POST['roll_number'];
    $student_name = $_POST['student_name'];
    $room_number = $_POST['room_number'];
    $course = $_POST['course'];
    $year = $_POST['year'];

    // Step 1: Check if room exists and status
    $checkRoom = $pdo->prepare("SELECT status FROM rooms WHERE room_number = ?");
    $checkRoom->execute([$room_number]);
    $room = $checkRoom->fetch(PDO::FETCH_ASSOC);

    if (!$room) {
        echo "<p style='color:red;text-align:center;'>❌ Room not found in database.</p>";
        exit;
    }

    if ($room['status'] == 'occupied') {
        echo "<p style='color:red;text-align:center;'>⚠️ This room is already occupied!</p>";
        exit;
    }

    // Step 2: Insert into room_allocation table (adjusted columns)
    $insert = $pdo->prepare("INSERT INTO room_allocation (roll_number, student_name, hostel_name, room_number, allocation_date)
                             VALUES (?, ?, ?, ?, NOW())");
    $insert->execute([$roll_number, $student_name, 'Hostel A', $room_number]); // You can replace 'Hostel A' dynamically later

    // Step 3: Update room status to occupied
    $updateRoom = $pdo->prepare("UPDATE rooms SET status = 'occupied' WHERE room_number = ?");
    $updateRoom->execute([$room_number]);

    echo "<p style='color:green;text-align:center;'>✅ Room allotted successfully and marked as occupied!</p>";
}
?>

