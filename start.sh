image='debian';
env='env';

echo boostraping $env with $image image

if [ "$(docker ps -a -q -f name=$env)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$env)" ]; then
        echo startig $env
        docker start $env
    fi
else
        echo creating new env
        env="$env" image="$image" docker-compose  -f ./.config/docker-compose.yml up --force-recreate -d --wait -V --remove-orphans
        #rm docker-compose.yml
fi

echo stating up now...
docker exec -it $env sh -c "export TERM='xterm-256color' && tmux new-session \; send-key 'nvim' C-m \; && exit"
