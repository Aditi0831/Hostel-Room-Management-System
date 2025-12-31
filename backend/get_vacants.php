<?php
include 'db_connect.php'; 


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $status = $_POST['status'];

    
    $stmt = $pdo->prepare("UPDATE vacants SET status = ? WHERE id = ?");
    $stmt->execute([$status, $id]);

    
    if ($status === 'Approved') {
        
        $get = $pdo->prepare("SELECT roll, current_room, new_room FROM vacants WHERE id = ?");
        $get->execute([$id]);
        $data = $get->fetch(PDO::FETCH_ASSOC);

        if ($data) {
            $roll = $data['roll'];
            $new_room = $data['new_room'];
            $current_room = $data['current_room'];

            
            $updateAlloc = $pdo->prepare("UPDATE room_allocation SET room_no = ? WHERE roll = ?");
            $updateAlloc->execute([$new_room, $roll]);

            
            $updateNewRoom = $pdo->prepare("UPDATE rooms SET status = 'Occupied' WHERE room_no = ?");
            $updateNewRoom->execute([$new_room]);

            $updateOldRoom = $pdo->prepare("UPDATE rooms SET status = 'vacant' WHERE room_no = ?");
            $updateOldRoom->execute([$current_room]);
        }
    }

    exit;
}


$query = $pdo->query("SELECT * FROM vacants ORDER BY id DESC");

while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
    echo "<tr>
            <td>{$row['id']}</td>
            <td>{$row['roll']}</td>
            <td>{$row['name']}</td>
            <td>{$row['hostel']}</td>
            <td>{$row['current_room']}</td>
            <td>{$row['new_room']}</td>
            <td>{$row['reason']}</td>
            <td>{$row['status']}</td>
            <td>
              <button class='approve' onclick=\"updateStatus({$row['id']}, 'Approved')\">Approve</button>
              <button class='reject' onclick=\"updateStatus({$row['id']}, 'Rejected')\">Reject</button>
            </td>
          </tr>";
}
?>



