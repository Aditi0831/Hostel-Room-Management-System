<?php
session_start();
require 'db_connect.php';


try {
    $stmt = $pdo->query("SELECT id, name, roll, course, year, gender, address, parent_name, contact, medical, affidavit, status FROM admissions");
    $applications = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Database error: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Hostel Applications</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background-color: #f4f8ff;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #004aad;
            color: white;
            text-align: center;
            padding: 1rem;
            font-size: 1.5rem;
            font-weight: 600;
        }
        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #004aad;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        .approve {
            background-color: #28a745;
        }
        .reject {
            background-color: #dc3545;
        }
        a {
            color: #004aad;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header>🏠 Hostel Applications</header>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Roll</th>
            <th>Course</th>
            <th>Year</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Parent Name</th>
            <th>Contact</th>
            <th>Medical</th>
            <th>Affidavit</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <?php foreach ($applications as $app): ?>
        <tr>
            <td><?= htmlspecialchars($app['id']) ?></td>
            <td><?= htmlspecialchars($app['name']) ?></td>
            <td><?= htmlspecialchars($app['roll']) ?></td>
            <td><?= htmlspecialchars($app['course']) ?></td>
            <td><?= htmlspecialchars($app['year']) ?></td>
            <td><?= htmlspecialchars($app['gender']) ?></td>
            <td><?= htmlspecialchars($app['address']) ?></td>
            <td><?= htmlspecialchars($app['parent_name']) ?></td>
            <td><?= htmlspecialchars($app['contact']) ?></td>
            <td>
                <?php if ($app['medical']): ?>
                    <a href="../uploads/<?= urlencode($app['medical']) ?>" download>Download</a>
                <?php else: ?>
                    N/A
                <?php endif; ?>
            </td>
            <td>
                <?php if ($app['affidavit']): ?>
                    <a href="../uploads/<?= urlencode($app['affidavit']) ?>" download>Download</a>
                <?php else: ?>
                    N/A
                <?php endif; ?>
            </td>
            <td><strong><?= htmlspecialchars($app['status'] ?? 'Pending') ?></strong></td>
            <td>
                <form action="update_status.php" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<?= $app['id'] ?>">
                    <button class="btn approve" name="status" value="Approved">Approve</button>
                </form>
                <form action="update_status.php" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<?= $app['id'] ?>">
                    <button class="btn reject" name="status" value="Rejected">Reject</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
