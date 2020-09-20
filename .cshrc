###
### .cshrc file for new users - revised 4/19/94
### .cshrc file for new users - revised 01/31/97
###

#  determine platform and operating system 

   switch( `uname -s` )
      case SunOS:
         if(-e /usr/ccs) then             # Sun running Sun 5.x 
            setenv SunOS_ver 5
            set temp=`/usr/ucb/hostname`
            set user=`/usr/ucb/whoami`
         else                             # Sun running Sun 4.1.x
            setenv SunOS_ver 4
            set temp=`/usr/bin/hostname`
            set user=`/usr/ucb/whoami`
         endif
         breaksw
      case  IRIX:                         # SG running IRIX
         setenv SunOS_ver 0
         set temp=`/usr/bsd/hostname`
         set user=`/usr/bin/whoami`
         breaksw
 	  case AIX:
         setenv SunOS_ver 1
         set temp=`/usr/bin/hostname`
         set user=`/usr/ucb/whoami`
         breaksw
   endsw   

#---------  if not an interactive shell, exit immediately  --------

   if ($?prompt == 0) exit

#---------  if you didn't exit, setup interactive shell  ---------

   unset histchars

   set mail=(60 /var/mail/$user)

# this changes the prompt, by default the ,% is interpreted
# by the shell to mean current command number

   if(${?temp} != 0) set prompt="$temp ,% "

#  gives 1000 entries for history

   set history=1000

#  this changes the histchars
#  , is for previous command   ; is for substitution

   set histchars=',;'

#  this forces you to type exit or logout to exit the session

   set ignoreeof
   set noclobber
   set notify

#  all files created will default to  -rwxr-xr-x

   umask 022

#  source users .alias file

   if( -e ~/.alias) source ~/.alias
