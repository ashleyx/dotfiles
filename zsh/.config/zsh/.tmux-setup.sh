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
	tmux split-window -h -t $session2
	tmux send-keys -t $session2:Load.2 'btop' C-m
	return
fi

exists=$(tmux list-sessions 2>/dev/null| grep $session3)
if [ "$exists" = "" ]
then
	# B2B
	tmux new-session -d -s $session3 -n 'Default'
   # # B2B DEV 
	#tmux send-keys -t $session3:B2B.1 'ssh epitome-dev-b2b-server' C-m
	#tmux send-keys -t $session3:B2B.1 'cd epitome-parser' C-m
	#tmux send-keys -t $session3:B2B.1 'docker-compose logs -f --tail=100' C-m
	#tmux select-pane -t $session3:B2B.1 -T 'DEV'
	## B2B PROD
	#tmux split-window -h -t $session3
	#tmux send-keys -t $session3:B2B.2 'ssh epitome-prod-b2b-server' C-m
	#tmux send-keys -t $session3:B2B.2 'cd epitome-parser' C-m
	#tmux send-keys -t $session3:B2B.2 'docker-compose logs -f --tail=100' C-m
	#tmux select-pane -t $session3:B2B.2 -T 'PROD'
	return
fi
