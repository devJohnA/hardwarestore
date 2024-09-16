<?php
session_start();

include 'admin/dbcon/conn.php';

$sessionId = isset($_GET['sessionId']) ? $_GET['sessionId'] : '';

if (!empty($sessionId)) {
    $sql = "SELECT m.*, 'user' as type, ar.reply_message, ar.timestamp as reply_timestamp
            FROM messages m
            LEFT JOIN admin_replies ar ON m.id = ar.message_id
            WHERE m.session_id = ?
            ORDER BY COALESCE(ar.timestamp, m.timestamp) ASC";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $sessionId);
    $stmt->execute();
    $result = $stmt->get_result();

    $messages = [];
    while ($row = $result->fetch_assoc()) {
        $messages[] = [
            'id' => $row['id'],
            'sender' => $row['sender'],
            'message' => $row['message'],
            'timestamp' => $row['timestamp'],
            'type' => $row['type'],
            'image_path' => $row['image_path']
        ];

        if (!empty($row['reply_message'])) {
            $messages[] = [
                'id' => 'admin_' . $row['id'],
                'sender' => 'Admin',
                'message' => $row['reply_message'],
                'timestamp' => $row['reply_timestamp'],
                'type' => 'admin',
                'image_path' => null // Assuming admin replies don't have images
            ];
        }
    }

    echo json_encode($messages);
} else {
    echo json_encode([]);
}

$conn->close();
?>