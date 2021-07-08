# function ssh() {
#     if [[ -n $(printenv TMUX) ]] ; then
#         local pane_id=$(tmux display -p '#{pane_id}')

#         hostAddr=notfound
#         for arg in $@
#         do
#           (echo $arg | grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" > /dev/null) && hostAddr=$arg
#         done
#         name=$(grep $hostAddr  ~/hosts | awk '{ print $2 }')
#         if [[ `echo $name | grep 'staging'` ]] ; then
#             tmux select-pane -t $pane_id -P 'default'
#         elif [[ `echo $name | grep 'dev'` ]] ; then
#             tmux select-pane -t $pane_id -P 'default'
#         else
#             tmux select-pane -P 'bg=colour52,fg=white'
#         fi

#         command ssh $@

#         tmux select-pane -t $pane_id -P 'default'
#     fi
# }
