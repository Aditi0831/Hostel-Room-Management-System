<?php
require 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roll = trim($_POST['roll']);

    try {
        $stmt = $pdo->prepare("SELECT name, roll, status FROM admissions WHERE roll = :roll");
        $stmt->execute(['roll' => $roll]);
        $app = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($app) {
            echo "<h2 style='font-family:Poppins;text-align:center;margin-top:100px;'>Hello, " . htmlspecialchars($app['name']) . " 👋<br>Your hostel application status is: <strong style='color:#004aad;'>" . htmlspecialchars($app['status']) . "</strong></h2>";
        } else {
            echo "<h3 style='font-family:Poppins;text-align:center;margin-top:100px;color:red;'>No record found for Roll Number: " . htmlspecialchars($roll) . "</h3>";
        }
    } catch (PDOException $e) {
        die("Database error: " . $e->getMessage());
    }
} else {
    header("Location:../student_check_status.html");
    exit();
}
?>
