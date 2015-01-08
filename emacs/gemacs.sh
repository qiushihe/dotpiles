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

  if [ -z "$1" ]; then
    STARTUP="(progn"
    STARTUP+="  (switch-to-buffer \"*scratch*\")"
    # Ensure the newly created frame has docus
    STARTUP+="  (select-frame-set-input-focus (selected-frame))"
    # Declare that 'working-directory' is a frame-local variable (and it's okay to do that
    # multiple times)
    STARTUP+="  (make-variable-frame-local 'working-directory)"
    STARTUP+="  (modify-frame-parameters nil '((working-directory . \"`pwd`\")))"
    STARTUP+="  (cd working-directory)"
    STARTUP+=")"

    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -c -e "$STARTUP" $@ > /dev/null
  else
    if [[ "$1" =~ ^- ]]; then
      /Applications/Emacs.app/Contents/MacOS/bin/emacsclient $@
    else
      /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -c $1
    fi
  fi
fi
