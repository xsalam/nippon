<?php
date_default_timezone_set('Asia/Jakarta');
require 'vendor/autoload.php';

use Nette\Database\Connection;
use Nette\Database\ConnectionException;

$dsn = 'pgsql:host=nippon_db;port=5432;dbname=nippon';
$user = 'nippon';
$pass = 'nippon';
try {
    $db = new Connection($dsn, $user, $pass);
} catch (ConnectionException $e) {
    echo $e->getMessage();
}
