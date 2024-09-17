
<?php 
include '../admin/dbcon/conn.php';
$msg = "";

if (isset($_GET['verification'])) {
    if (mysqli_num_rows(mysqli_query($conn, "SELECT * FROM tblcustomer WHERE code='{$_GET['verification']}'")) > 0) {
        $query = mysqli_query($conn, "UPDATE tblcustomer SET code='' WHERE code='{$_GET['verification']}'");
        
        if ($query) {
            $msg = "<div class='alert alert-success'>Account verification has been successfully completed.</div>";
        }
    } else {
        header("Location: index.php");
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        html, body {
            height: 100%;
            background-color: #faf9f6;
        }
        .login-container {
            max-width: 400px;
            width: 90%;
        }
        .btn-social {
            width: 40px;
            height: 40px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btn-danger {
            background-color: #fd2323;
        }
        .btn-danger:hover {
            background-color: #f71d1d;
        }
        .password-container {
            position: relative;
        }
        .password-toggle {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .start-end {
            text-align: right;
        }
        .google-icon {
            width: 18px;
            height: 18px;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">
    <div class="login-container bg-white p-4 rounded shadow">
        <div class="start-end"> <img src="win.png" width="80" height="80"></div>
        <h2 class="text-center mb-3">Hello Again!</h2>
        <p class="text-center mb-4">Welcome back you've been missed!</p>
        <?php echo $msg; ?>
        <form action="../login.php"  method="POST" id="loginForm">
        <input class="proid" type="hidden" name="proid" id="proid" value="">
            <div class="mb-3">
                <input type="email"  id="U_USERNAME"  name="U_USERNAME" class="form-control" placeholder="Email account" required>
            </div>
            <div class="mb-3 password-container">
                <input type="password" name="U_PASS" class="form-control"  id="U_PASS" placeholder="Password">
                <span class="password-toggle" onclick="togglePassword()">
                    <i class="fas fa-eye" id="toggleIcon"></i>
                </span>
            </div>
            <div class="text-end mb-3">
                <a href="forgot-password.php" class="text-primary text-decoration-none">Forgot password?</a>
            </div>
            <button type="submit" id="modalLogin" name="modalLogin" class="btn btn-danger w-100 mb-3">Sign in</button>
            <p class="text-center mb-0">Not a member? <a href="signup.php" class="text-danger">Signup</a></p>
        </form>
        <p class="text-center mt-1">
            <a href="../index.php" class="text-dark text-decoration-none">Back to Home Page</a>
        </p>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
 document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const formData = new FormData(this);
    formData.append('modalLogin', 'true');
    
    fetch('../login.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: data.message,
                showConfirmButton: false,
                timer: 1500
            }).then(() => {
                window.location.href = data.redirect;
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: data.message
            });
        }
    })
    .catch(error => {
        console.error('Error:', error);
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!'
        });
    });
});

        function togglePassword() {
            const passwordInput = document.getElementById('U_PASS');
            const toggleIcon = document.getElementById('toggleIcon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
        
    </script>

</body>
</html>