<?php
include 'db_connect.php';

$roll = $_GET['roll'];

// Fetch latest application for that student
$stmt = $pdo->prepare("SELECT * FROM vacants WHERE roll = ? ORDER BY id DESC LIMIT 1");
$stmt->execute([$roll]);
$app = $stmt->fetch();

if ($app) {
    echo "<strong>Name:</strong> {$app['name']}<br>";
    echo "<strong>Current Room:</strong> {$app['current_room']}<br>";
    echo "<strong>Hostel:</strong> {$app['hostel']}<br>";
    echo "<strong>Request Type:</strong> {$app['transfer']}<br>";
    echo "<strong>Reason:</strong> {$app['reason']}<br><br>";

    // Show approval status with color
    $color = ($app['status'] == 'Approved') ? 'green' : (($app['status'] == 'Rejected') ? 'red' : 'orange');
    echo "<strong>Status:</strong> <span style='color:$color'>{$app['status']}</span><br>";

    // Show new room if transfer is approved
    if ($app['transfer'] == 'Yes, request room transfer' && $app['status'] == 'Approved') {
        echo "<strong>New Room Assigned:</strong> " . ($app['new_room'] ? $app['new_room'] : 'Awaiting room assignment') . "<br>";
    }

    echo "<strong>Vacate Date:</strong> {$app['vacate_date']}<br>";
} else {
    echo "No application found for this roll number.";
}
?>
