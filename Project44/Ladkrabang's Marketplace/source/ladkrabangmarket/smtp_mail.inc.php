<?php

   /*
    * save as "smtp_mail.inc"
    */

   class smtp_mail {
      var $fp = false;
      var $lastmsg = "";

      /*
       * read_line() reads a line from the socket
       * and returns the numeric code and the rest of the line
       */

      function read_line()
      {
         $ret = false;

         $line = fgets($this->fp, 1024);

         if(ereg("^([0-9]+).(.*)$", $line, &$data)) {
            $recv_code = $data[1];
            $recv_msg  = $data[2];

           $ret = array($recv_code, $recv_msg);
         }

         return $ret;
      }

      /*
       * dialogue() sends a command $cmd to the remote server
       * and checks whether the numeric return code is the one
       * we expect ($code). 
       */

      function dialogue($code, $cmd)
      {
         $ret = true;

         fwrite($this->fp, $cmd."\r\n");

         $line = $this->read_line($this->fp);

         if($line == false) {
            $ret = false;
            $this->lastmsg = "";
         } else {
            $this->lastmsg = "$line[0] $line[1]";

            if($line[0] != $code) {
               $ret = false;
            }
         }

         return $ret;
      }

      /* 
       * error_message() prints out an error message,
       * including the last message received from the SMTP server.
       */

      function error_message()
      {
          echo "SMTP protocol failure (".$this->lastmsg.").<br>";
}

      /*
       * crlf_encode() fixes line endings 
       * RFC 788 specifies CRLF (hex 0x13 0x10) as line endings
       */

      function crlf_encode($data)
      {
         # make sure that the data ends with a newline character
         $data .= "\n";
         # remove all CRs and replace single LFs with CRLFs
         $data = str_replace("\n", "\r\n", str_replace("\r", "", $data));
         # in the SMTP protocol a line consisting of a single "." has
         # a special meaning. We therefore escape it by appending one space.
         $data = str_replace("\n.\r\n", "\n. \r\n", $data);

         return $data;
      }

      /*
       * handle_e-mail() talks to the SMTP server
       */

      function handle_email($from, $to, $data)
      {
         # split recipient list
         $rcpts = explode(",", $to);

         $err = false;
         if(!$this->dialogue(250, "HELO phpclient") ||
               !$this->dialogue(250, "MAIL FROM:$from")) {
            $err = true;
         }

         for($i = 0; !$err && $i < count($rcpts); $i++) {
            if(!$this->dialogue(250, "RCPT TO:$rcpts[$i]")) {
               $err = true;
           }
      }

      if($err || !$this->dialogue(354, "DATA") ||
                 !fwrite($this->fp, $data) || 
                 !$this->dialogue(250, ".") ||
                 !$this->dialogue(221, "QUIT")) {
            $err = true;
         }

         if($err) {
         $this->error_message();
         }

         return !$err;
      }

      /*
       * connect() connects to an SMTP server on the well-known port 25
       */

      function connect($hostname)
      {
         $ret = false;

         $this->fp = fsockopen($hostname, 25);

         if($this->fp) {
            $ret = true;
         }

         return $ret;
      }

      /*
       * send_e-mail() connects to an SMTP server, encodes the message
       * optionally, and sends $data. The envelope sender address
       * is $from. A comma-separated list of recipients is expected in $to. 
       */

      function send_email($hostname, $from, $to, $data, $crlf_encode = 0)
      {
         if(!$this->connect($hostname)) {
            echo "cannot open socket<br>\n";
            return false;
         }

         $line = $this->read_line();
         $ret  = false;

         if($line && $line[0] == "220") {
            if($crlf_encode) {
               $data = $this->crlf_encode($data);
            }

            $ret = $this->handle_email($from, $to, $data);
         } else {
            $this->error_message();
         }

         fclose($this->fp);

         return $ret;
      }
   }
?>
