#!/bin/bash

get_server ()
{
  SERVER_PID=`ps -A | grep -e "\/Applications\/Emacs\.app\/Contents\/MacOS\/Emacs.\+--daemon" | awk '{if ($1) print $1}'`
}

stop_server ()
{
  get_server
  if [ -n "$SERVER_PID" ]; then
    echo "Stopping Emacs server ..."
    kill -KILL $SERVER_PID

    get_server
    if [ -n "$SERVER_PID" ]; then
      echo "Error stopping Emacs server!"
    else
      echo "Emacs server stopped"
    fi
  else
    echo "Emacs server is not running"
  fi
}

start_server ()
{
  get_server
  if [ -n "$SERVER_PID" ]; then
    echo "Emacs server is already running. PID: $SERVER_PID"
  else
    echo "Starting Emacs server ..."
    /Applications/Emacs.app/Contents/MacOS/Emacs --daemon

    get_server
    if [ -n "$SERVER_PID" ]; then
      echo "Emacs server started. PID: $SERVER_PID"
    else
      echo "Error starting Emacs server!"
    fi
  fi
}

restart_server ()
{
  stop_server
  start_server
}

if [ "$1" = "--start-server" ]; then start_server;
elif [ "$1" = "--stop-server" ]; then stop_server;
elif [ "$1" = "--restart-server" ]; then restart_server;
else
  get_server
  if [ -z "$SERVER_PID" ]; then WAIT_FOR_START=1; fi

  start_server
  if [ -n "$WAIT_FOR_START" ]; then sleep 1; fi

  if [ -z "$1" ] || [[ "$1" =~ ^- ]]; then
    # If the first argument is empty or that it start with dash (i.e. a option such as "-t")
    # then we launch emacsclient:
    # * with a new frame; and ...
    # * switch to the scratch buffer; and ...
    # * focus the frame; and ...
    # * switch to the current working directory
    # Also redirect output to avoid displaying the result of the script evaluation in stdout
    STARTUP="(progn"
    STARTUP+="  (switch-to-buffer \"*scratch*\")"
    STARTUP+="  (select-frame-set-input-focus (selected-frame))"
    STARTUP+="  (cd \"`pwd`\")"
    STARTUP+=")"
    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -c -e "$STARTUP" $@ > /dev/null
  else
    # Otherwise just launch with a new frame and pass in all the arguments
    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -c $@
  fi
fi
