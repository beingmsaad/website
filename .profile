ucb

echo "Enter terminal type (wyse50) \c"
read TERM
if test ! "$TERM"  
then
	TERM=wyse50 
fi

PATH=.:/usr/new:/usr/ucb:/usr/bin:/bin:/usr/local/bin:/usr/local:/usr/hosts:/etc:/usr/etc

export TERM PATH

echo "Terminal set to: $TERM"

stty -tabs crt erase ''  intr '^C' kill '^X' susp '^Z' dsusp '^Y'

# be notified of incoming mail immediately
biff y

