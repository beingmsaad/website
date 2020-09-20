###
### .login file for new users - revised 4/21/94
### .login file for new users - revised 2/12/98
###

#  use operating system version to set PATH variable

if(${SunOS_ver} == 4) then     # Sun running SunOS 4.1.x
      setenv PATH .:/usr/local/bin:/usr/local/hosts:/usr/ucb:/usr/local/x11r5/bin:/usr/bin:/bin:/usr/etc:$PATH
	  setenv MANPATH /usr/man:/usr/local/man:/usr/local/x11r5/man
	  setenv BIBINPUTS .:/usr/local/lib/tex/inputs
	  setenv TEXINPUTS .:$HOME/latex:$HOME/tmp:/usr/local/lib/tex/inputs:/usr/local/lib/tex/bib
      setenv XDVIFONTS "/usr/local/lib/tex/fonts:/usr/local/lib/tex/fonts/pxl:/usr/local/lib/tex/fonts/gf"
	  setenv LD_LIBRARY_PATH /usr/local/x11r5/lib:/usr/lib
endif

if(${SunOS_ver} == 5) then     # Sun running SunOS 5.x
      setenv TERM vt100
      setenv LD_LIBRARY_PATH /usr/openwin/lib:/usr/lib:/usr/dt/lib
      setenv PATH .:/usr/local/bin:/usr/openwin/bin:/usr/dt/bin:/usr/local/hosts:/usr/ucb:/usr/bin:/bin:/usr/ccs/bin:/usr/etc
	  setenv MANPATH /usr/local/man:/usr/man 
	  setenv TEXMF   /usr/local/teTeX/texmf
	  setenv TEXINPUTS .:$HOME/latex:$TEXMF/tex//
	  setenv BIBINPUTS .:$HOME/latex:$TEXMF/bibtex/bib//
	  setenv BSTINPUTS .:$HOME/latex:$TEXMF/bibtex/bst//
endif

if(${SunOS_ver} == 1) then     # IBM AIX
      setenv TERM vt100
      setenv LD_LIBRARY_PATH /usr/lib:/usr/dt/lib
      setenv PATH .:/usr/local/bin:/usr/bin:/usr/ccs/bin:/usr/etc
endif

if(${SunOS_ver} == 0) then     # SG running IRIX
      setenv TERM vt100
      setenv PATH .:/usr/local/bin:/usr/local/hosts:/usr/bin/X11:/usr/bsd:/usr/bin:/bin:/usr/etc:/usr/sbin
endif
 
#  if unknown, set terminal type

   if ($TERM == "" || $TERM == "unknown" || $TERM == "network") then
      echo ""
      echo -n "Enter terminal type (vt100)  "
      set term = $<
      if ($term == "") set term = vt100
      setenv TERM $term
      echo ""
      echo "   TERM set to $TERM"
      echo ""
   endif

#  set environment variables
   setenv EDITOR vi 
   setenv NNTPSERVER news.cs.ucf.edu
   setenv SMTPSERVER mail.cs.ucf.edu

#  set HOST_NAME variable to machine name  

   if(${?temp} != 0) setenv HOST_NAME $temp


#  let other users write to your /dev/###

   mesg y

#  set up backspace, interrupt, delete current command line, 
#  suspend process, and delayed suspend process - which waits for read
#  before signaling the processes associated with the terminal

#  to be notified of incoming mail immediately,
#  remove # from line below


if(${SunOS_ver} != 0) then     # SG running IRIX
   biff y
   stty -tabs crt erase  intr ^C kill ^X susp ^Z dsusp ^Y
else
   stty erase ^H intr ^C kill ^X susp ^Z
endif

#  set the file name completion feature,  type ESC to complete filenames

   set filec
    
