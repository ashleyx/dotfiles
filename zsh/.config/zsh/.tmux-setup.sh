#!bin/zsh

session1="Local"
session2="Performance"
session3="Server"

exists=$(tmux list-sessions 2>/dev/null| grep $session1)
if [ "$exists" = "" ]
then
	tmux new-session -d -s $session1 -n 'Config'
	tmux send-keys -t $session1:Config.1 'cd ~/dotfiles' C-m
	tmux new-window -t $session1 -n 'Code'
	tmux send-keys -t $session1:Code.1 'cd ~/git' C-m
	return
fi

exists=$(tmux list-sessions 2>/dev/null| grep $session2)
if [ "$exists" = "" ]
then
	tmux new-session -d -s $session2 -n 'Load'
	tmux send-keys -t $session2:Load.1 'nvtop' C-m
	tmux split-window -v -t $session2
	tmux send-keys -t $session2:Load.2 'btop' C-m
	return
fi

exists=$(tmux list-sessions 2>/dev/null| grep $session3)
if [ "$exists" = "" ]
then
	tmux new-session -d -s $session3 -n 'Default'
	return
fi
