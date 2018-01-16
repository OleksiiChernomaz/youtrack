# Dockerized YouTrack

- quick start if you just want to try the tool, or want to use it on a regular base 
- alpine based image
- original youTrack package: nothing removed or changed

# What is YouTrack

Plan, estimate and manage your team’s work by tracking the time being spent on development and other activities.
Read more on the official site: https://www.jetbrains.com/youtrack/

# How to use

- run image using docker-compose (as an example, you can take a look at the `./docker-compose.yml``)
- be careful when install baseURL port and application port - they might be different. Usually application port is 8080, but baseURL port can be anything, you have specified when you run docker
- check `Files structure` section to see which folders/files you can share with your host or override
- do not forget to set up backups time interval. This is a docker image and it's crash means that potentially you can loose some data.

> ### Warning 
> 
> When you need to terminate your server, highly recommended to run `stop` command to make a correct termination, otherwise you may loose some runtime data inside:
> ```
>    # /var/lib/youtrack/bin/youtrack.sh stop, for example:
>    docker exec -it youtrack sh -c '/var/lib/youtrack/bin/youtrack.sh stop
> ```


# Files structure

- `/var/lib/youtrack/backups`   - contains scheduled or manually triggered backups, which you can set up in the admin area (highly recommended to share this folder with your host)
- `/var/lib/youtrack/conf`      - project configuration files, including JVM config. Refer to the YouTrack documentation to see what can be adjusted (inject)
- `/var/lib/youtrack/data`      - data storage, contains files / indexes, etc of the project (recommended to share this folder with your host)
- `/var/lib/youtrack/logs`      - log files. If you share this folder, do not forget to take care about `logrotatation`

# How to contribute

> ### Note 
> 
> This container was created for internal purposes and meets all the requirements to 
> start use `YouTrack` quickly and in scalable way.
> 
> If you detect issues with container, report - if this issue affects
> regular work, most probably it would be fixed (if issue related to the container and it's environment). If possible, try to fix it yourself and make a PR.
>
> Also, ensure that issue, you report is not related to the software, which is should be reported on the YouTack bugreports

- checkout appropriate branch
- make sure that you have pulled all the latest changes from the remote branch
- make all the changes, create a pull request
- after PR is merged, your changes would be applied during next release

# Known bugs

- sometimes ticket description change triggers page reload. But the same behaviour was detected on native installation, which means that this is an application issue.
- you tell :)

# To make a test build on your local machine:

```
docker build --compress --pull --force-rm --squash --tag oleksiichernomaz/youtrack:2017.4 .
docker run -it oleksiichernomaz/youtrack:2017.4 sh
```

