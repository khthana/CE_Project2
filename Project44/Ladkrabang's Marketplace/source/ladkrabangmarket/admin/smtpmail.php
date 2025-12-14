<?php

include "mime_mail.inc.php";
include "smtp_mail.inc.php";

function smail($from,$to,$subject,$body){

# our relaying SMTP server
$smtp_server = "diamond.ce.kmitl.ac.th";
# the sender address
//$from        = "webmaster@ce.kmitl.ac.th";
# the recipient(s)
//$to          = "robiuz@hotmail.com";
# the subject of the e-mail
//$subject     = "Test Mime email";
# ... and its body
//$body        = "Here goes the real text of the e-mail.

//Multiple lines
//are allowed, of course.";


# create mime_mail instance

$mail = new mime_mail;

$mail->from    = $from;
$mail->to      = $to;
$mail->subject = $subject;
$mail->body    = $body;

# get the constructed e-mail data

$data = $mail->get_mail();

# create smtp_mail instance

$smtp = new smtp_mail;

# send e-mail


$smtp->send_email($smtp_server, $from, $to, $data);

}
?>
