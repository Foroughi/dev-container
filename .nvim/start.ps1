#powershell.exe -noexit -file ".nvim\start.ps1" "MY-PC"

$image = 'debian'
$env = 'env'

Write-Host "Bootstrapping $env with $image image"

$container = docker ps -a -q -f name=$env
if ($container) {
    $exitedContainer = docker ps -aq -f status=exited -f name=$env
    if ($exitedContainer) {
        Write-Host "Starting $env"
        docker start $env
    }
} else {
    Write-Host "Creating new environment"
    $env:env=$env;$env:image=$image; docker compose -f ./.nvim/docker-compose.yml up --force-recreate -d --wait -V --remove-orphans
}

Write-Host "Starting up now..."
docker exec -it $env sh -c "export TERM='xterm-256color' && tmux new-session \; send-key 'nvim' C-m \; && exit"
