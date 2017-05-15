<?php
$db_host = 'localhost';
$db_user = 'root';
$db_password = '';
$db_name = 'ahp';

$web_host='http://localhost/spk_ahp/';

$link=mysql_connect($db_host,$db_user,$db_password);
mysql_select_db($db_name,$link);

?>