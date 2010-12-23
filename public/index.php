<?php

    define ('DS',DIRECTORY_SEPARATOR);
    define ('ROOT',dirfile(dirfile(__FILE___)));

    $url = $_GET['url'];

    require_once(ROOT . DS . 'library' . DS . 'bootstrap.php');
