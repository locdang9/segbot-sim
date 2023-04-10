# Launch

Acquire xauthority
```
./install/xauth.sh
```

Config xhost. This method exposes PC to external source.
Therefore, it is need to find an alternative. 
```
xhost +
```

Launch seg robot
```
docker-compose up
```

Debug
```
docker compose  exec segbot-bash bash 

```