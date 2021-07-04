<?php header('Access-Control-Allow-Origin: *'); ?>
<?php
$TARGET=$_GET['url'];
$output=null;
$retval=null;
#$output = system("youtube-dl -j \"${TARGET}\" | jq -r \".tags[]\" | tr '\n' ',' | sed 's/,/\n/'", $retval);
$output = system("bash extract.sh \"${TARGET}\"", $retval);
#echo "$output";
?>
