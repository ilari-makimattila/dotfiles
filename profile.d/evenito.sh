function print-vhosts() {
  docker inspect $(docker ps --format "{{.ID}}") | jq '.[] | .Config.Env | .[]' -r | grep VIRTUAL_HOST | sed 's/VIRTUAL_HOST=//'
}

function update-vhosts() {
  for vhost in $(print-vhosts)
  do
    grep -q " $vhost" /etc/hosts || echo "127.1.0.1 $vhost" | sudo tee -a /etc/hosts
  done
}
