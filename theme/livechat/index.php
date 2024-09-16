<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Responsive Chat Box Design | CodingNepal</title>
      <link rel="stylesheet" href="style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
   <body>
      <input type="checkbox" id="click">
      <label for="click">
      <i class="fab fa-facebook-messenger"></i>
      <i class="fas fa-times"></i>
      </label>
      <div class="wrapper">
         <div class="head-text">
            Let's chat? - Online
         </div>
         <div class="chat-box">
            <div class="desc-text">
               Please fill out the form below to start chatting with the next available agent.
            </div>
            <form action="#">
               <div class="field">
                  <input type="text" placeholder="Your Name" required>
               </div>
               <div class="field">
                  <input type="email" placeholder="Email Address" required>
               </div>
               <div class="field textarea">
                  <textarea cols="30" rows="10" placeholder="Explain your queries.." required></textarea>
               </div>
               <div class="field">
                  <button type="submit">Start Chat</button>
               </div>
            </form>
         </div>
      </div>
   </body>
</html>