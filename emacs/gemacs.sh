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

if [ $1 = "--start-server" ]; then start_server;
elif [ $1 = "--stop-server" ]; then stop_server;
elif [ $1 = "--restart-server" ]; then restart_server;
else
  /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -c $@
fi
