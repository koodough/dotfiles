#!/bin/bash

#http://maketecheasier.com/8-useful-and-interesting-bash-prompts/2009/09/04
#http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#Prompt Theme
case `uname` in
	Linux)
		#icon=">"
		icon="\u@\h"
		error="0_0"
		info="\u@\h"
		;;
	Darwin)
		#icon="🍋 "
		icon="⦿"
		#icon="\u@\h"
		#icon="( ° ͜ʖ °)"
		#icon="ʕ◔ϖ◔ʔ"
		#icon="(ಠ▽ಠ)"
		#icon="(⌐■_■)"
		#error="( •_•)>⌐■-■"
		#icon="ᶘ ᵒᴥᵒᶅ"
		#icon="ಠ_ರೃ"
		#error="ಠ_ಠ"
		error="!!!!"
		info="\u@\h "
		;;
	*)

esac

function prompt {

#echo $0;


#No commands before the $?. Or it won't capture the user's command last command
	if [ $? = 0 ];then 
		echo "\[\e[36m\]$icon \[\e[37;1m\]\[\e[37;1m\]\W\[\e[32;1m\] \[\e[34;1m\]\$(ls -1 | /usr/bin/wc -l | sed 's: ::g') \[\e[32;1m\](\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]"; 
	else 
		echo "\[\e[31m\]$error \[\e[32;1m\](\[\e[37;1m\]$info \$(id -u)\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\] \[\e[34;1m\]\$(ls -1 | /usr/bin/wc -l | sed 's: ::g') items\[\e[32;1m\])\n(\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]";
	fi


}


platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	#Linux
	platform='linux'

	#Prompt
	PROMPT_COMMAND="PS1=\`prompt $?\`"
	#UTF8
	#PS1="\`if [ \$? = 0 ];then echo \[\e[33m\]\">\[\e[37;1m\]\W\[\e[32;1m\] \[\e[34;1m\]\$( ls -1 | /usr/bin/wc -l | sed 's: ::g') \[\e[32;1m\](\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]\"; else echo \"\[\e[31m\]ಠ_ಠ \[\e[32;1m\](\[\e[37;1m\]\u@\h \$(id -u)\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\] \[\e[34;1m\]\$(ls -1 | /usr/bin/wc -l | sed 's: ::g') items\[\e[32;1m\])\n(\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]\"; fi\`"
	#"
	#PS1="\`if [ \$? = 0 ];then echo \[\e[33m\]\">\[\e[37;1m\]\W\[\e[32;1m\] \[\e[34;1m\]\$( ls -1 | /usr/bin/wc -l | sed 's: ::g') \[\e[32;1m\](\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]\"; else echo \"\[\e[31m\]0_0 \[\e[32;1m\](\[\e[37;1m\]\u@\h \$(id -u)\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\] \[\e[34;1m\]\$(ls -1 | /usr/bin/wc -l | sed 's: ::g') items\[\e[32;1m\])\n(\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]\"; fi\`"
	#"
	#`

	#EDITOR
	export EDITOR=$(which vim)

	#Linux Commands
	#GO GUI! Open file browser
	alias open="nautilus"

	##Free memory
	alias purge="sync; echo 3 > /proc/sys/vm/drop_caches"
	##Sleep
	alias sleepytime="echo -n mem > /sys/power/state;"
	alias n8="sleepytime"
	alias ls='ls -lhp --color -G'

	
	alias VirtualBox="for m in vbox{drv,netadp,netflt}; do modprobe $m; done; VirtualBox &"
	function VBox {
	for m in vbox{drv,netadp,netflt}; do modprobe $m; done; 
	VirtualBox;
	}
	alias mountfolder="mount -rbind"

	#Debian
	#alias eix='apt-cache search'
	#alias emerge='apt-get install'

	#Centos
	#alias eix='yum search'
	#alias emerge='yum install'


elif [[ "$unamestr" == 'Darwin' ]]; then
	#Mac

	#Prompt
	#echo "mac"
	PROMPT_COMMAND="PS1=\`prompt $?\`"
	#PS1="\`prompt\`"
	#PS1="\`if [ \$? = 0 ];then echo \"🍋  \[\e[37;1m\]\W\[\e[32;1m\] \[\e[34;1m\]\$(ls -1 | /usr/bin/wc -l | /usr/bin/sed 's: ::g') \[\e[32;1m\](\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]\"; else echo \"\[\e[31m\]ಠ_ಠ \[\e[32;1m\](\[\e[37;1m\]\u@\h \$(id -u)\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\] \[\e[34;1m\]\$(ls -1 | /usr/bin/wc -l | /usr/bin/sed 's: ::g') items\[\e[32;1m\])\n(\[\e[37;1m\]!\\!\[\e[32;1m\])\\$ \[\e[0m\]\"; fi`"
	#"
	#`

	#EDITOR
	export EDITOR=$(which mvim)

	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'

	alias textedit='open -a TextEdit'
	alias mvim='open -a MacVim'
	alias flush='dscacheutil -flushcache'
	alias updatedb="sudo /usr/libexec/locate.updatedb"

	#QUICK edit
	alias e='open -a MacVim'


fi




#tunnelblick
function kick-in-the-balls() {
echo "Kick!"
killall $1
sleep 1
echo "Walk it off!"

if [[-n $2]]; then 
	eval $2
else
	$2
fi
}


# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

#Private bash shortcuts
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi



#Only works for macs in bashrc. Bash history autocomplete with the UP/DOWN keys. Great for ssh
#bind '"\e[A": history-search-backward'
#bind '"\e[B": history-search-forward'

#Default editor
alias edit='~/Applications/MacVim.app/Contents/MacOS/MacVim'
alias edit='gvim'
#export EDITOR=/usr/bin/vim
export EDITOR=$(which vim)

#Common Commands
alias punchinface='killall $1 ; $1'
#mac
alias dns='sudo killall -HUP mDNSResponder'
alias open='open -a Finder'
alias finder='open -a Finder'
alias mvim='open -a MacVim'
alias macvim='~/Applications/MacVim.app/Contents/MacOS/MacVim'
#both
alias mountls='mount |column -t'
alias screen='screen -xARRUS main'
alias screenkill='screen -X -S main kill'
alias ports='lsof -i'
alias space='df -h'
alias df='df -h'
alias du='du -sh'
alias hostsupdate='curl http://someonewhocares.org/hosts/hosts -o /etc/hosts && cat /etc/hosts.head >> /etc/hosts'
alias size='du -sh'
alias sha1='openssl sha1'
alias wget='wget -c'
alias ls='ls -lhp -G'
export LSCOLORS=Exfxcxdxbxegedabagacad
cd() { builtin cd "$1" ; ls; }


#Searching
alias g="grep -i"
alias search='egrep -ir --include=*.{php,html,go,md,txt,less,conf,rb,erb}'
alias searchall='egrep -ir'
alias searchFiles='egrep -lir --include=*.{php,html,js,go,md,txt,css,less,conf,rb,erb}'
alias searchf='egrep -lir --include=*.{php,html,js,go,md,txt,css,less,conf,rb,erb}'
alias rsearch="history | grep $@"



#function search() {
#if [[ -z "$2" ]]; then 
#egrep -ir --include=*.{php,html,go,md,txt,css,less,conf} $1 .'
#else
#egrep -ir --include=*.{$2} $1 .'
#fi
#}

#Screen
function settitle() {
if [ -n "$STY" ] ; then         # We are in a screen session
	echo "Setting screen titles to $@"
	printf "\033k%s\033\\" "$@"
	screen -X eval "at \\# title $@" "shelltitle $@"
else
	printf "\033]0;%s\007" "$@"
fi
			   }


			   export CLICOLOR=1
			   #Setup platform_family using ohai
			   #Gentoo
			   export PATH=$PATH:/usr/local/sbin:/etc/init.d
			   #export PATH=$PATH:/usr/local/sbin

			   #Code
			   export CODE="$HOME/Sites/code"
			   alias code="cd '$CODE'"

			   #Project
			   alias project="cd ~/Sites/Current\ Project"

			   #Chef
			   alias kitchen="cd ~/Sites/chef-repo/"

			   #GO
			   alias gohome="cd '$GOPATH'"
			   alias gosrc="cd '$GOPATH/src'"
			   alias gocode="cd '$GOPATH/src'"
			   alias goroot="cd '$GOROOT'"
			   export GOPATH="$HOME/Sites/Go"
			   export GOROOT="$HOME/Sites/GoRoot"
			   export PATH=$PATH:$GOROOT/bin
			   export PATH=$GOPATH/bin:$PATH
			   export PATH=/usr/local/bin:$PATH
			   export PATH=/sbin:/bin:/usr/sbin:/usr/bin:$PATH

			   #NPM
			   export PATH=/usr/local/share/npm/bin:$PATH

			   #Other Bins
			   export PATH=$PATH:/Library/PostgreSQL/9.2/bin


			   #Web
			   alias header='curl -I' # get web server headers
			   alias headerc='curl -I --compress' # find out if remote server supports gzip / mod_deflate or not #
			   alias httpdreload='sudo /Aether/bin/apachectl -k graceful' #reload web server

			   ## shortcut  for iptables and pass it via sudo#
			   alias ipt='sudo /sbin/iptables'

			   # display all rules #
			   alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
			   alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
			   alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
			   alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
			   alias firewall=iptlist

			   alias optout="sudo curl 'http://someonewhocares.org/hosts/hosts' -o /etc/hosts"

			   #ssh-copy-id
			   alias signin="signup"
			   function signup {
			   echo "$@"
			   ssh-keygen -R ${@#*@}
			   cat ~/.ssh/id_rsa.pub | ssh $@ 'mkdir -p  ~/.ssh/; cat >> ~/.ssh/authorized_keys'
			   ssh $@
		   }

		   function ssh_key {
		   echo "$@"
		   cat ~/.ssh/id_rsa.pub | ssh $@ 'cat >> ~/.ssh/authorized_keys'
	   }

	   function ssh_dsa {
	   echo "$@"
	   cat ~/.ssh/id_dsa.pub | ssh $@ 'cat >> ~/.ssh/authorized_keys'
   }

   function ssh-copy-id-local {

   if [[ -z $1 ]]; then
	   read -p ":Send $HOME/.ssh/id_rsa.pub to which user?: " user;
	   user=${user:-"root"};
   fi

   if [[ -e $HOME/.ssh/id_rsa.pub ]]; then
	   ssh-keygen;
   fi
   cat $HOME/.ssh/id_rsa.pub >> /home/$1/.ssh/authorized_keys
}


function nuke {

if [[ -e "$@/dev" ]]; then 
	echo "Please don't nuke your root";
else
	echo "Nuking";
fi
#rm -rf

}

# Network Copy #

# Copy Via SCP
function scptarhome {

folder=$1
destination="$2 $3 $4 $5"

tar czf - $folder | ssh $destination tar xzf - -C ~/

}

#Copy Via Net cat 


#copy profile

function scpdotfiles {

echo "scp -P $PORT ~/.bashrc $@:~/"
scp -P $PORT ~/.bashrc $1:~/

echo "scp -P $PORT ~/.screenrc $@:~/"
scp -P $PORT ~/.bashrc $1:~/

echo "scp -P $PORT ~/.inputrc $@:~/"
scp -P $PORT ~/.bashrc $1:~/
}


function sync {

SOURCE=$1
DESTINATION=$2

echo -e "rsync --partial --progress --human-readable --archive --update --delete-before --stats \n"
#echo -e "rsync -Phau --delete-before --stats \n"
echo "rsync -Phau --delete-before --stats $SOURCE $DESTINATION"
echo "--delete-before will remove files from the $DESTINATION that are not on $SOURCE"
read -p "Press Enter to rsync $SOURCE to $DESTINATION"

rsync -Phau --delete-before --stats \
"$SOURCE" "$DESTINATION" >> "$SOURCE/rsync_backup.log";

}

function sync-ssh {

echo "sync-ssh"

}


alias tasks="cd ~/Tasks/";
alias todos="cd ~/Tasks/";
alias task="cd ~/Tasks/";
alias todo="cd ~/Tasks/";

#What do you intend to do?
function intend {

#Inputs
directory=$1
options=$2

#Go to directory
cd $directory

#Name of directory
name="`basename \`pwd\``"

#Total number of tasks
#tasks="`ls -l ~/Tasks/ | wc -l`"



while test -n "$@"; do
   case "$@" in	
	   "")
			mkdir -p ~/Tasks/

			echo "~/Tasks/$name"
			if [[ -h "$HOME/Tasks/$name" ]]; then
				echo "$HOME/Tasks/$name already exists";
				cd "$HOME/Tasks/$name"
				break
				exit 0;
			fi


			echo "Adding $name to Tasks $tasks."
			#echo "ln -s `pwd` ~/Tasks/$name"
			ln -s `pwd` ~/Tasks/$name
			break
			shift
			;;
		rm|--remove|-r)
			rm "~/Tasks/$name"
			shift
			;;
		help|--help|-h|*)
			echo "Usage intend ~/Kitchen/cookbooks/apache; vim README.md"
			shift
			;;
	esac
done

clear
ls -l

}


#files
alias mvlevelup="time mv * ../;";




#toolbox mv all dotfiles
function toolbox {

if [[ ! -z $3 ]]; then
	PORT=$3
else
	PORT=22
fi

echo "scp -P $PORT ~/.bashrc $@:~/"
scp -P $PORT ~/.bashrc $1:~/

echo "scp -P $PORT ~/.inputrc $1:~/ "
scp -P $PORT ~/.inputrc $1:~/

if [[ $2 == "new" ]]; then

	echo "scp -P $PORT ~/.ssh/rc $@:~/.ssh/rc"
	ssh -p $PORT $1 'mkdir -p ~/.ssh'
	ssh_key "-p $PORT $1"
	#scp -P $PORT ~/.ssh/rc $1:~/.ssh/rc

	#echo "Adding inputrc to /etc/inputrc"
	#echo "run this command once to avoid spamming your /etc/inputrc"
	#ssh -p $PORT $1 'cat ~/.inputrc >> /etc/inputrc'

	echo "Auto screen if root - Adding rule to /etc/profile"
	echo "run this command once to avoid spamming your /etc/profile"
	ssh -p $PORT $1 'echo "if [ \"\${EUID}\" = \"0\" ] || [ \"\${USER}\" = \"root\" ] ; then screen -xRRA; fi" >> /etc/profile'

fi
}


alias killvagrant="sudo vagrant halt" #premisson to kill?

#Ruby bashrc
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting
export GEM_HOME=$HOME/.gems

#Librarian-chef has a deep stack!
ulimit -s 16384

#/usr/local/rvm/bin:\
export PATH=/bin:\
$HOME/.gems/gems:\
/sbin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/usr/sbin:\
/usr/local/share/npm/bin:\
/opt/local/bin:\
/opt/local/sbin:\
/opt/X11/bin:\
$HOME/Sites/Go/bin:\
$HOME/Sites/GoRoot/bin:\
/usr/local/git/bin:\
/usr/local/go/bin:\
/etc/init.d:\
/Library/PostgreSQL/9.2/bin:\
$HOME/.gems/bin


if which rbenv 2>/dev/null; then
	eval "$(rbenv init -)"
fi
