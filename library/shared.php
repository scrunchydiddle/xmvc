<?php

function setReporting() {
    error_reporting(E_ALL);
    if (DEVELOPMENT_ENVIRONMENT == true){
        ini_set('display_errors','On');
    }else {
        ini_set('display_errors','Off');
        ini_set('log_errors','On');
        ini_set('error_log', ROOT . DS . 'tmp' . DS . 'logs' . DS . 'error_log');
    }
}

function stripSlashesDeep($value) {
    $value = is_array($value) ? map_array('stripSlashesDeep',$value) : stripSlashes($value);
    return $value;
}

function removeMagicQuotes() {
    if( get_magic_quotes_gpc()){
        $_GET   = stripSlashesDeep($_GET);
        $_POST  = stripSlashesDeep($_POST);
        $_COOKIE  = stripSlashesDeep($_COOKIE);
    }
}

function unregisterGlobals() {

}
