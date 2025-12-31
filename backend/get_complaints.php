<?php
include 'db_connect.php';
$stmt = $pdo->query("SELECT * FROM complaints");
echo '<ul>';
while ($row = $stmt->fetch()) {
    echo '<li>' . $row['name'] . ' - ' . $row['type'] . ': ' . $row['description'] . '</li>';
}
echo '</ul>';
?>