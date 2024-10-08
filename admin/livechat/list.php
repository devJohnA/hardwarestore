<style>
        #chat-list {
    max-height: 300px; /* Adjust the height as needed */
    overflow-y: auto; /* Enable vertical scrolling */
}
        .chat-list-item {
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .chat-list-item:hover {
            background-color: #f0f0f0;
        }
        .active {
            background-color: #d3d3d3;
        }
        .conversation-container {
            border: 1px solid #ccc;
            padding: 10px;
            height: 400px;
            overflow-y: scroll;
            background-color: white;
        }
        .message {
            max-width: 70%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 18px;
            word-wrap: break-word;
            clear: both;
        }
        .user-message {
            float: left;
            background-color: #f1f0f0;
            color: #000;
        }
        .admin-message {
            float: right;
            background-color: #1E90FF;
            color: white;
        }
        .message-time {
            font-size: 0.75em;
            margin-top: 5px;
            display: block;
        }
        .user-message .message-time {
            color: #888;
        }
        .admin-message .message-time {
            color: white;
        }
        .message-sender {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .just-now {
            font-weight: bold;
            color: #4CAF50;
            margin-right: 5px;
        }
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        .message-image {
            max-width: 200px;
            max-height: 200px;
            margin-top: 10px;
            border-radius: 10px;
        }

        .modal {
    display: none; 
    position: fixed; 
    z-index: 1000; 
    padding-top: 120px; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgba(0, 0, 0, 0.8); 
}


.modal .close {
    position: absolute;
    top: 55px;
    right: 25px;
    color: #ffffff;
    font-size: 35px;
    font-weight: bold;
    cursor: pointer;
}


.modal-content {
    margin: auto;
    display: block;
    width: 80%; 
    max-width: 700px; 
    max-height: 80vh; 
    object-fit: contain; 
}

.modal-content {
    animation-name: zoom;
    animation-duration: 0.6s;
}

@keyframes zoom {
    from {transform: scale(0.1);}
    to {transform: scale(1);}
}

.modal .close:hover,
.modal .close:focus {
    color: #bbb;
}
    </style>
    
            <section>
                <div class="container py-5">
                    <div class="row">
                        <div class="col-md-6 col-lg-5 col-xl-4 mb-4 mb-md-0">
                            <h5 class="font-weight-bold mb-3 text-center text-lg-start">Customers</h5>
                            <div class="card">
                                <div class="card-body">
                                    <ul class="list-unstyled mb-0" id="chat-list">
                                        <!-- User messages will be dynamically inserted here -->
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-7 col-xl-8">
                            <div class="conversation-container" id="conversation-container">
                                <!-- Conversation messages will be dynamically inserted here -->
                            </div>
                            <div class="form-group mt-3">
                                <textarea class="form-control bg-body-tertiary" id="message-textarea" rows="4" placeholder="Type a reply..."></textarea>
                                <button type="button" class="btn btn-info btn-rounded float-end mt-2" id="send-message-btn">Send</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section> 	
    <div id="imageModal" class="modal">
        <span class="close">&times;</span>
        <img class="modal-content" id="modalImage">
    </div>				
    <script>
  // Global variables
let activeUserId = null;
let lastMessageTimestamp = null;
let isUpdating = false;
let isSending = false;
let messageCache = new Set();
let lastChatListUpdate = 0;
let lastMessageBySameUser = null;

// Debounce function
function debounce(func, timeout = 300) {
    let timer;
    return (...args) => {
        clearTimeout(timer);
        timer = setTimeout(() => { func.apply(this, args); }, timeout);
    };
}

function formatTime(dateString) {
    const date = new Date(dateString);
    return date.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });
}

function isJustNow(dateString) {
    const now = new Date();
    const messageTime = new Date(dateString);
    const diffInMinutes = (now - messageTime) / 60000;
    return diffInMinutes < 5; // Consider messages within the last 5 minutes as "Just now"
}

function scrollChatListToBottom() {
    const chatList = document.getElementById('chat-list');
    chatList.scrollTop = chatList.scrollHeight;
}

// Function to load the chat list
function loadChatList() {
    const now = Date.now();
    if (now - lastChatListUpdate < 5000) return; // Prevent updating more than once every 5 seconds
    lastChatListUpdate = now;

    fetch('fetchMessages.php')
        .then(response => response.json())
        .then(data => {
            const chatList = document.getElementById('chat-list');
            chatList.innerHTML = '';
            data.users.forEach(user => {
                const listItem = document.createElement('li');
                listItem.className = 'p-2 border-bottom bg-body-tertiary chat-list-item';
                listItem.dataset.userId = user.id;

                const justNowText = isJustNow(user.timestamp) ? '<span class="just-now">Just now</span>' : '';

                listItem.innerHTML = `
                    <div class="d-flex flex-row">
                        <div class="pt-1">
                            <p class="fw-bold mb-0">${user.name}</p>
                            <p class="small text-muted">${user.message}</p>
                        </div>
                    </div>
                    <div class="pt-1">
                        <p class="small text-muted mb-1">
                            ${justNowText}
                            <span class="message-time">${formatTime(user.timestamp)}</span>
                        </p>
                    </div>
                `;
                chatList.appendChild(listItem);
            });

            // Highlight active user if one is selected
            if (activeUserId) {
                const activeItem = chatList.querySelector(`[data-user-id="${activeUserId}"]`);
                if (activeItem) activeItem.classList.add('active');
            }
        });

        scrollChatListToBottom();
}

function loadConversation(userId) {
    if (isUpdating) return;
    isUpdating = true;

    fetch(`fetchMessages.php?user_id=${userId}${lastMessageTimestamp ? '&last_timestamp=' + lastMessageTimestamp : ''}`)
        .then(response => response.json())
        .then(data => {
            const conversationContainer = document.getElementById('conversation-container');
            const messages = data.conversations || [];
            let newMessages = false;

              // Clear the conversation container if it's a new user
              if (userId !== activeUserId) {
                conversationContainer.innerHTML = '';
                messageCache.clear();
                lastMessageTimestamp = null;
            }

            messages.forEach(msg => {
                const messageKey = `${msg.sender}-${msg.timestamp}-${msg.message}`;
                if (!messageCache.has(messageKey)) {
                    messageCache.add(messageKey);
                    const messageDiv = document.createElement('div');
                    const timestamp = new Date(msg.timestamp);
                    const formattedTime = isNaN(timestamp.getTime()) ? 'Invalid Date' : timestamp.toLocaleTimeString();

                    if (msg.sender === 'user') {
                        messageDiv.className = 'message user-message';
                    } else if (msg.sender === 'admin') {
                        messageDiv.className = 'message admin-message';
                    }

                    messageDiv.innerHTML = `
                        <div class="message-sender">${msg.username}</div>
                        ${msg.message}
                        <span class="message-time">${formattedTime}</span>
                    `;

                    // Add image if it exists
                    if (msg.image_path) {
                        const imgElement = document.createElement('img');
                        imgElement.src = '../../' + msg.image_path;
                        imgElement.className = 'message-image';
                        imgElement.alt = 'User uploaded image';
                        imgElement.onclick = function () {
                            openImageModal(this.src);
                        };
                        imgElement.onerror = function () {
                            this.style.display = 'none';
                            console.error('Failed to load image:', msg.image_path);
                        };
                        messageDiv.appendChild(imgElement);
                    }

                    // Check if the message is from the same user as the previous one
                    if (lastMessageBySameUser && lastMessageBySameUser.sender === msg.sender) {
                        messageDiv.classList.add('same-user');
                    } else {
                        lastMessageBySameUser = msg;
                    }

                    conversationContainer.appendChild(messageDiv);
                    newMessages = true;
                }
            });

            // Add a clearfix div to ensure proper container height
            const clearfix = document.createElement('div');
            clearfix.className = 'clearfix';
            conversationContainer.appendChild(clearfix);

            if (newMessages) {
                conversationContainer.scrollTop = conversationContainer.scrollHeight;
            }
            if (messages.length > 0) {
                lastMessageTimestamp = messages[messages.length - 1].timestamp;
            }
            activeUserId = userId;
            isUpdating = false;
        })
        .catch(error => {
            console.error('Error:', error);
            isUpdating = false;
        });
}

// Function to send a message
function sendMessage() {
    if (isSending || activeUserId === null) return;

    const messageTextarea = document.getElementById('message-textarea');
    const replyMessage = messageTextarea.value.trim();

    if (replyMessage === '') return;

    isSending = true;
    const formData = new FormData();
    formData.append('reply_message', replyMessage);
    formData.append('user_id', activeUserId); // Use the active user ID instead of email

    fetch('sentMessage.php', {
        method: 'POST',
        body: formData
    })
        .then(response => response.text())
        .then(data => {
            console.log(data);
            if (data.includes("Reply sent successfully")) {
                messageTextarea.value = '';
                loadConversation(activeUserId); // Reload conversation
                loadChatList(); // Update the chat list
            } else {
                alert(data);
            }
            isSending = false;
        })
        .catch(error => {
            console.error('Error:', error);
            isSending = false;
        });
}

const debouncedSendMessage = debounce(() => {
    if (!isSending) sendMessage();
}, 300);

function updateChat() {
    loadChatList();
    if (activeUserId !== null && !isUpdating && !isSending) {
        loadConversation(activeUserId);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    loadChatList();

    document.getElementById('chat-list').addEventListener('click', (event) => {
        const userId = event.target.closest('.chat-list-item')?.dataset.userId;
        if (userId) {
            document.querySelectorAll('.chat-list-item').forEach(item => item.classList.remove('active'));
            event.target.closest('.chat-list-item').classList.add('active');
            loadConversation(userId);
        }
    });

    document.getElementById('send-message-btn').addEventListener('click', debouncedSendMessage);

    document.getElementById('message-textarea').addEventListener('keypress', function (e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            debouncedSendMessage();
        }
    });

    setInterval(updateChat, 5000);
});

function openImageModal(src) {
    const modal = document.getElementById('imageModal');
    const modalImg = document.getElementById('modalImage');
    modal.style.display = "block";
    modalImg.src = src;
}

document.querySelector('.close').onclick = function() {
    document.getElementById('imageModal').style.display = "none";
}

window.onclick = function(event) {
    const modal = document.getElementById('imageModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
    </script>