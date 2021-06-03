alias container-ip="docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
