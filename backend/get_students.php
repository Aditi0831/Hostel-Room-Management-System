<?php
include 'db_connect.php';
$stmt = $pdo->query("SELECT * FROM student_details");
echo '<ul>';
while ($row = $stmt->fetch()) {
    echo '<li>' . $row['name'] . ' - DOB: ' . $row['dob'] . '</li>';
}
echo '</ul>';
?>