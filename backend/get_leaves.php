<?php
include 'db_connect.php';

$stmt = $pdo->query("SELECT * FROM leaves");
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo "<div class='leave-card' style='border:1px solid #ccc; padding:10px; margin-bottom:10px; border-radius:10px;'>";
    echo "<strong>{$row['name']}</strong> (Roll: {$row['roll']})<br>";
    echo "From: {$row['leave_from']} to {$row['leave_to']}<br>";
    echo "Reason: {$row['reason']}<br>";

    if ($row['approved'] == 1) {
        echo "<button class='approved' disabled>Approved</button>";
    } elseif ($row['approved'] == 2) {
        echo "<button class='rejected' disabled>Rejected</button>";
    } else {
        echo "<button onclick='approveLeave({$row['id']}, 1)'>Approve</button> ";
        echo "<button onclick='approveLeave({$row['id']}, 2)'>Reject</button>";
    }

    echo "</div>";
}
?>

<script>
function approveLeave(id, status) {
  if (confirm('Are you sure you want to update this leave?')) {
    fetch('approve_leave.php', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: 'id=' + id + '&status=' + status
    })
    .then(response => response.text())
    .then(data => {
      alert(data);
      location.reload();
    });
  }
}
</script>
