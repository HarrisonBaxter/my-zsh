
function setupProxy {
  local PROXY_USER=$1
  local PROXY_PASS=$2
  local PROXY_SERVER=$3
  local PROXY_PORT=$4

  export http_proxy=http://${PROXY_USER}:${PROXY_PASS}@${PROXY_SERVER}:${PROXY_PORT}
  export ftp_proxy=${http_proxy}
  export rsync_proxy=${http_proxy}
  export https_proxy=${http_proxy}
  java_proxy_props="-Dhttp.proxyHost=${PROXY_SERVER} -Dhttp.proxyPort=${PROXY_PORT} -Dhttp.proxyUser=${PROXY_USER} -Dhttp.proxyPassword=${PROXY_PASS}"
  export java_proxy_props="${java_proxy_props} -Dhttps.proxyHost=${PROXY_SERVER} -Dhttps.proxyPort=${PROXY_PORT} -Dhttps.proxyUser=${PROXY_USER} -Dhttps.proxyPassword=${PROXY_PASS}"
  
  echo "proxy's been set up"
}

export -f setupProxy

function setupProxyInteractive {
  echo "Provide proxy details"
  local PROXY_USER
  local PROXY_PASS
  local PROXY_SERVER
  local PROXY_PORT
  read -p "user:" PROXY_USER
  read -p "password (url encoded):" -s PROXY_PASS && echo ""
  read -p "server:" PROXY_SERVER
  read -p "port:" PROXY_PORT

  setupProxy ${PROXY_USER} ${PROXY_PASS} ${PROXY_SERVER} ${PROXY_PORT}
}

export -f setupProxyInteractive

function clearProxy {
  unset  http_proxy
  unset  ftp_proxy
  unset  rsync_proxy
  unset  https_proxy
  unset  java_proxy_props
  echo "proxy cleared"
}

export -f clearProxy

