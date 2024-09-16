<?php
session_start();

include '../dbcon/conn.php';

// Function to fetch the latest message for each user
function getLatestMessages($conn) {
    $sql = "SELECT m1.*
            FROM messages m1
            INNER JOIN (
                SELECT sender, MAX(timestamp) as max_timestamp
                FROM messages
                GROUP BY sender
            ) m2 ON m1.sender = m2.sender AND m1.timestamp = m2.max_timestamp
            ORDER BY m1.timestamp DESC";

    $result = $conn->query($sql);
    $users = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $users[] = [
                'id' => $row['id'],
                'name' => $row['sender'],
                'message' => $row['message'],
                'timestamp' => $row['timestamp']
            ];
        }
    }

    return $users;
}

if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];
    $sql = "SELECT m.*, m.sender as username, ar.reply_message, ar.timestamp as reply_timestamp, m.image_path
            FROM messages m
            LEFT JOIN admin_replies ar ON m.id = ar.message_id
             WHERE m.sender = (SELECT sender FROM messages WHERE id = ?)
            ORDER BY COALESCE(ar.timestamp, m.timestamp) ASC";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    $conversations = [];
    while ($row = $result->fetch_assoc()) {
        $conversations[] = [
            'sender' => 'user',
            'username' => $row['username'],
            'message' => $row['message'],
            'timestamp' => $row['timestamp'],
            'image_path' => $row['image_path']  // Include image_path in the response
        ];

        if (!empty($row['reply_message'])) {
            $conversations[] = [
                'sender' => 'admin',
                'username' => 'Admin',
                'message' => $row['reply_message'],
                'timestamp' => $row['reply_timestamp'],
                'image_path' => null  // Assuming admin replies don't have images
            ];
        }
    }

    echo json_encode(['conversations' => $conversations]);
} else {
    $users = getLatestMessages($conn);
    echo json_encode(['users' => $users]);
}

$conn->close();
?>