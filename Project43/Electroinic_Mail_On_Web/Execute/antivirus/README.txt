
README for InoculateIT ® UNIX Inocucmd command line utility 4.0

This README file describes the following for the InoculatIT command line
utility: 

    - Product pre-requisites 
    - Installation instructions 
    - Basic product startup and shutdown instructions 
    - Manifest
    - Platform specific release notes 
    - General usage instructions
    - Automating virus scans
    - Using the 'update_signature' script

Product pre-requisites

    - Red Hat Linux 6.0 or above
    - Caldera Linux 2.3 or above
    - Turbo Linux 4.0 or above
    - SuSE Linux 6.3 or above
    - Solaris 5.6 or 5.7
    - AIX 4.2 or 4.3
    - HP/UX 11.0 or above


Installation instructions

    - Decompress and extract the tar file:
		cd <desired installation directory>
		uncompress inoctar.<platform>.Z
		tar -xvf inoctar.<platform>
		(where <platform> is SOLARIS, LINUX, AIX, or HPUX)

Manifest

    - inocucmd : (size varies from .8M to 1.5M) virus scanning utility
    - virsig.dat : (size varies from .76M to 2M) virus signature file
    - update_signature : script to download new signature package when necessary
    - ftpdownload : script which actually downloads data
    - README.txt : this file


Platform specific release notes


    - Installation issues  - 

     Turbo Linux :
         Missing C++ runtime libraries : If you encounter an error
         similar to the following when running inocucmd:

     libstdc++-libc6.1-1.so.2: cannot open shared object file: No such file or directory

         you can create a symbolic link in /usr/lib/ which will satisfy inocucmd
         using the following commands (as root).

         cd /usr/lib
         ln -s libstdc++.so.2.7.2 libstdc++-libc6.1-1.so.2 



General usage instructions


   The inocucmd command line utility allows users to identify and deal 
   with files infected by viruses. Users can opt to cure, delete, move,
   or rename infected files.

   Users should check http://support.ca.com/Download/virussig.html
   for virus signature updates. For general information regarding 
   Computer Associates see http://www.ca.com and for information
   regarding the InoculatIT family of products see 
   http://www.ca.com/products/inoculateit.htm.

   The first time a user invokes the inocucmd command line utility a
   license file will be presented. Once the user has accepted the terms
   of the license the command will continue.


   Usage: inocucmd [ -options ] file|directory ...


        Options:

          (Choose zero or one of FST, SEC or REV)
          FST  Fast Scan (default). Checks the beginning
               and end of each file. Using Fast Scan 
               improves scanning efficiency when processing
               large groups of files. Important! It is possible
               for a file to have a virus that may be missed by
               Fast Scan.
          SEC  Secure scan. Examines the entire file. This is a
               thorough way to check files but is slower than
               running a fast scan.
          REV  Reviewer scan. Also examines the entire file. In
               addition, it searches for virus-like activity within
               files. Under unique circumstances, the Reviewer Scan 
               may generate a false alarm. Therefore, use this scan
               only when you have not selected a scanner Action (see
               below).


          (Choose zero or one of CUR, DEL, MOV, REN or MAR)
          CUR  Scan & cure infected files. Removes certain known 
               viruses from infected files and restores the files
               to their original state. If the file cannot be cured, 
               it will renamed with an .AVB extension (refer to REN
               below.) Even if inocucmd cures the file we recommend
               you remove the infected file and then restore the 
               original file.
          DEL  Scan & delete infected files
          MOV  Move infected files to ~/VIRUS
          REN  Rename infected files by giving them an extension of 
               .AVB. Files with this extension will not be scanned.
               If a file exists with the .AVB extension and an 
               infected file in the same directory will result in
               the same file name, the .AVB extension will be changed.
               The extension will become .AV# and the number will be 
               incremented for each subsequent occurrence (.AV0,.AV1, etc.).
          MAR  Move & rename infected files to ~/VIRUS

          (Choose any of NEX, NOC, NOS, FIL, LIS, APP, VER or HEL)
          NEX  Detect compressed files by content, not file extension 
               (expensive)
               Note: Use this option when scanning for infected attachments in
               email files.
          NOC  Don't scan compressed files (.ZIP, .ARJ, .Z, ...)
          NOS  No subdirectory traverse
          FIL <pattern>  Only scan files that match <pattern> (shell wildcard)
          LIS <file>  Create scan report file <file>
          APP <file>  Append scan report to file <file>
          VER  Verbose mode
          HEL or ?  Display this help

          file|directory ...: Specify at least one file or directory to scan

          Note: when specifying a directory, you must enter the ending 
          slash. For example:  ./inocucmd /home/smith/



   
   The inocucmd command line utility may be terminated at any time by pressing
   cntrl-C.


   Command line return codes.


	100 - A virus was detected.
         >2 - One or more files could not be scanned due to some type of open or
              read failure, such as an access error where the user does not have
              the proper permission necessary to scan(read) a file (RC=4).
          1 - User pressed cntrl-C.
          0 - The scan has completed. All file(s) were scanned, and
              no viruses were detected. 

   Note: The highest return code encountered will be returned. For instance
         if a non-root user scanned a large directory which had one or more 
         files with permissions set such that they could not be read, and the 
         user eventually pressed "cntrl-C", the return code would not be 1, but 
         rather the higher return code indicating that some files could not
         be scanned. If a virus was detected, then the return code would be
         100.


===============================================================================

Automating virus scans.

   You can automate the process of scanning for viruses by adding an entry
   to your cron table. For example, you can use the following commands to 
   scan all mounted filesystems every 8 hours. (Assume that the package has
   been installed in /usr/local/av.)

       crontab -l > /tmp/crontab.out
       echo '0 0,8,16 * * * (cd /usr/local/av; ./inocucmd /) >> /tmp/scan.log 2>&1' >> /tmp/crontab.out
       crontab /tmp/crontab.out

    Or use the following to scan mail files every 30 minutes:

       crontab -l > /tmp/crontab.out
       echo '0,30 * * * * (cd /usr/local/av; ./inocucmd -nex /var/spool/mail) >> /tmp/scan.log 2>&1' >> /tmp/crontab.out
       crontab /tmp/crontab.out

    To take action if a virus is found, use one or more of the following
    options:  CUR, DEL, MOV, REN or MAR.

    Note - in the above examples, you should check the log and search for any
    indication of a virus(es) being found. You should also periodically remove
    the logfile as it will get quite large on a daily basis.


===============================================================================

Using the 'update_signature' script.

   This script can be used to download and update the virus signature
   file and the "inocucmd" utility itself. The script first downloads
   a small text file to determine if there is a new package to download.
   If there is not it will exit. If there is, it will continue.

   You can automate this procedure by adding an entry to your cron table.
   Example: 
      # (Assume that the package has been installed in /usr/local/av/)
      # Run update_signature at 1am every day.
      crontab -l > /tmp/crontab.out
      echo '0 1 * * 0,1,2,3,5,6 /usr/local/av/update_signature > /tmp/update_sig.log 2>&1' >> /tmp/crontab.out
      crontab /tmp/crontab.out

   Note: The update_signature will first attempt to use 'lynx' to download 
   files.

   If lynx is not available, it will use ftp.  The advantage to using lynx is 
   that its configuration file (typically /etc/lynx.cfg, but this can vary) 
   can  be modified to point to a proxy server.  This will allow you to 
   download from behind a firewall.

   If ftp is the only program available to download data and a firewall prevent
   direct internet access, then you may choose to either allow the connection 
   to ftp://ftp.ca.com within your firewall or simply check the site manually 
   using a browser of your choice.

   Using a browser, go to either ftp://ftp.ca.com/pub/getbbs/solaris.eng,
   ftp://ftp.ca.com/pub/getbbs/linux.eng, ftp://ftp.ca.com/pub/getbbs/aix.eng,
   or ftp://ftp.ca.com/pub/getbbs/hpux.eng, depending on your machine type, 
   check for a version of inoctar.{PLATFORM}.Z more recent that yours and if 
   one exists download it, then install it using the directions at the 
   beginning of this README file.

===============================================================================
