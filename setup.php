<?php

/**
 * Execute an sql query in the database. The correct database connection
 * will be chosen and the query will be logged with the success status.
 *
 * @param string $query string query to execute
 */
function exec_query($query) {
    global $database, $errors;

    $conn = $database->getConnectionHandler();
    $success = $conn->Query($query);

    //Kimai_Logger::logfile($query);
    if (!$success) {
        $errorInfo = serialize($conn->Error());
        Kimai_Logger::logfile('[ERROR] in [' . $query . '] => ' . $errorInfo);
        $errors = true;
    }
}
include('/var/www/html/includes/basics.php');
$randomAdminID = random_number(9);
echo "=================================================\n";
echo "Setting up default Password for admin: changeme \n";
echo "=================================================\n";
$adminPassword = encode_password('changeme');
$query = "INSERT INTO `kimai_users` (`userID`,`name`,`mail`,`password`, `globalRoleID` ) VALUES ('$randomAdminID','admin','admin@example.com','$adminPassword',1);";
exec_query($query);
$query = "INSERT INTO `kimai_groups_users` (`groupID`,`userID`, `membershipRoleID`) VALUES ('1','$randomAdminID','1');";
exec_query($query);