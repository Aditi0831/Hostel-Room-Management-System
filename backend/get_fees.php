<?php
include 'db_connect.php';
$stmt = $pdo->query("SELECT * FROM fees");
echo '<ul>';
while ($row = $stmt->fetch()) {
    echo '<li>' . $row['name'] . ' - Amount: ' . $row['amount'] . ' for ' . $row['month'] . '</li>';
}
echo '</ul>';
?>