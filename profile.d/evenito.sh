function print-vhosts() {
  docker inspect $(docker ps |rg evenito | awk '{print $1}') | jq '.[] | .Config.Env | .[]' -r | rg VIRTUAL_HOST | sed 's/VIRTUAL_HOST=//'
}

function update-vhosts() {
  for vhost in $(print-vhosts);
  do
    rg -q $vhost /etc/hosts || echo "127.1.0.1 $vhost" | sudo tee -a /etc/hosts
  done
}
