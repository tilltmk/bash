# bash
collection of useful bash scripts

----------------

DNS-Fix Script:

download script, modify DNS and interface in it as you wish;
open terminal with root session (sudo -s), cd into directory of the script;
run: chmod +x dns-fix.sh
and then execute the script with ./dns-fix.sh
-- after that, create a cronjob (also with root) with crontab -e and paste the following: 
*/1 * * * * root /path/to/file/dns.sh
; after that, you  maybe want to paste the same cron-task into /etc/crontab.

----------------
