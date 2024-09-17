<?php
define('DB_SERVER', 'localhost');
define('DB_USER', 'u510162695_dried');
define('DB_PASS', '1Dried_password');
define('DB_NAME', 'u510162695_dried');

// Create connection
$conn = new mysqli(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $proid = $_POST['proid'];
    $name = $conn->real_escape_string($_POST['name']);
    $rating = intval($_POST['rating']);
    $reviewtext = $conn->real_escape_string($_POST['reviewtext']);

    // Validate inputs
    if (empty($name)) {
        die("Name is required");
    }
    if ($rating < 1 || $rating > 5) {
        die("Invalid rating");
    }
    if (empty($reviewtext)) {
        die("Review text is required");
    }

    $sql = "INSERT INTO tblcustomerreview (PROID, CUSTOMERNAME, RATING, REVIEWTEXT) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isis", $proid, $name, $rating, $reviewtext);

    if ($stmt->execute()) {
        echo "Review submitted successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();

// Redirect back to the product page
header("Location: index.php?q=single-item&id=" . $proid);
exit();
?>