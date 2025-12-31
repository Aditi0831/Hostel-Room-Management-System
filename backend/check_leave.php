<?php
include 'db_connect.php';

$roll = $_POST['roll']; 

$stmt = $pdo->prepare("SELECT * FROM leaves WHERE roll = ?");
$stmt->execute([$roll]);

if ($stmt->rowCount() > 0) {
    echo "<h2>Your Leave Applications</h2>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<div style='border:1px solid #ccc; padding:10px; margin-bottom:10px; border-radius:10px;'>";
        echo "<strong>Name:</strong> {$row['name']}<br>";
        echo "<strong>From:</strong> {$row['leave_from']} to {$row['leave_to']}<br>";
        echo "<strong>Reason:</strong> {$row['reason']}<br>";

        // Status display
        if ($row['approved'] == 1) {
            echo "<strong>Status:</strong> ✅ Approved";
        } elseif ($row['approved'] == 2) {
            echo "<strong>Status:</strong> ❌ Rejected";
        } else {
            echo "<strong>Status:</strong> ⏳ Pending";
        }

        echo "</div>";
    }
} else {
    echo "<p>No leave applications found for this roll number.</p>";
}
?>
