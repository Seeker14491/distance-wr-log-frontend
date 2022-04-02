# distance-wr-log-frontend

The frontend for a webapp that shows a log of new individual level world records for the game [Distance](http://survivethedistance.com/).

[Link to backend repo](https://github.com/Seeker14491/distance-wr-log-backend)

## Docker usage

### Building

```
docker build --build-arg PUBLIC_URL=/distance-log -t distance-wr-log-frontend .
```

- The `PUBLIC_URL` build arg must be set based on the url the webapp will be hosted at.

### Running

```
docker run -p 80:80 -v /data:<...> -v /etc/caddy/Caddyfile:<...> distance-wr-log-frontend
```

- `/data` needs to be bound to a directory or volume containing `changelist.json` produced by the backend.
- `/etc/caddy/Caddyfile` needs to be bound to an appropriate `Caddyfile`, such as one with these contents:

```
:80

encode zstd gzip

handle /changelist.json {
    file_server {
        root /data
    }
}

handle {
    file_server
}
```
