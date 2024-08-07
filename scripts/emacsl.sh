#!/bin/bash
#
# Emacs Launcher
# This script will ensure emacs is running in server mode before launching emacsclient
#

if [ -z "$EMACSL_EMACS_PATH" ]; then
  EMACSL_EMACS_PATH="/Applications/Emacs.app/Contents/MacOS/Emacs"
fi

if [ -z "$EMACSL_EMACSCLIENT_PATH" ]; then
  EMACSL_EMACSCLIENT_PATH="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
fi

get_server ()
{
  SERVER_PID=`$EMACSL_EMACSCLIENT_PATH -e "(emacs-pid)" 2> /dev/null`
  if ! [[ $SERVER_PID =~ ^[0-9]+$ ]]; then
    SERVER_PID=""
  fi
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

    # Start Emacs in server mode
    $EMACSL_EMACS_PATH --daemon

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
  # Relaunch client after restarting the server
  if [ "$1" = "--restart" ]; then
    restart_server
    # Also remove the first argument
    shift
  fi

  # First check if the server is running or not
  get_server
  # ... and if the server is not running, indicates that we want to wait for
  # the server to finish starting up later on. Not sure why this is necessary
  # but it is otherwise emacsclient will be launched too early.
  if [ -z "$SERVER_PID" ]; then WAIT_FOR_START=1; fi

  # Ensure the server is running
  start_server
  # ... and if the server wasn't running to start with, wait 1 second for it to
  # finish starting up.
  if [ -n "$WAIT_FOR_START" ]; then sleep 1; fi

  # If this script is called without any argument ...
  if [ -z "$1" ]; then
    # Then prepare a startup script (which is run after init.el) that:
    # * Switch the new frame to the "scratch" buffer (so we're not looking at
    #   some random buffer every time a new frame is created by this script)
    # * Ensure the newly created frame has focus
    STARTUP="(progn"
    STARTUP+="  (switch-to-buffer \"*scratch*\")"
    STARTUP+="  (select-frame-set-input-focus (selected-frame))"
    STARTUP+=")"

    # ... and launch emacsclient with the startup script
    $EMACSL_EMACSCLIENT_PATH -n -c -e "$STARTUP" $@ > /dev/null
  else
    # If this script is called with arguments, but the first argument starts with a "-", which means
    # it's an option of sort, then launch emacsclient without any default arguments (i.e. in this
    # case all arguments to emacsclient must be passed in manually).
    if [[ "$1" =~ ^- ]]; then
      $EMACSL_EMACSCLIENT_PATH $@
    else
      # If this script is called with non-options argument, then assume the first argument is the
      # file to open and launch emacsclient to open that file.
      $EMACSL_EMACSCLIENT_PATH -n -c $1
    fi
  fi
fi
