# see what is listening on a given port
port() {
  lsof -n -i:$1 | grep LISTEN
}

# kill what is listening on a given port
killport() {
  local pid=$(port $1 | awk '{print $2}')
  if [[ $pid ]]; then
    kill -9 $pid
  else
    echo "No process found on port ${1}"
  fi
}
