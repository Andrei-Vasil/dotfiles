alias bmwproxy='ssh -fND 1080 qxz4v5x@bmwgate2.pzs.de '
if ! pgrep -f "autossh -N  -D 1080 qxz4v5x@bmwgate2.pzs.de" >/dev/null
then
	autossh -fN -D 1080 qxz4v5x@bmwgate2.pzs.de
fi 
# Leave out until proven useful:
# export HTTP_PROXY=127.0.0.1:8080
# export HTTPS_PROXY=127.0.0.1:8080
# export NO_PROXY=github.com,gitlab.pzs.de,pypi.org,pythonhosted.org,docker.com,aws.com,amazonaws.com,ubuntu.com,docker.internal,127.0.0.1,localhost