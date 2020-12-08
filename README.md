<p align="center">
    <img src="/static/logo.png?v=1.0.0" width="200" />
    <h3 align="center">Mammal</h3>
    <p align="center">A Sample Microservice.</p>
    <p align="center">
        <a href="https://github.com/clivern/mammal/actions/workflows/build.yml">
            <img src="https://github.com/clivern/mammal/actions/workflows/build.yml/badge.svg">
        </a>
        <a href="https://github.com/clivern/mammal/actions">
            <img src="https://github.com/clivern/mammal/workflows/Release/badge.svg">
        </a>
        <a href="https://github.com/clivern/mammal/releases">
            <img src="https://img.shields.io/badge/Version-1.0.0-9B59B6.svg">
        </a>
        <a href="https://goreportcard.com/report/github.com/clivern/mammal">
            <img src="https://goreportcard.com/badge/github.com/clivern/mammal?v=1.0.0">
        </a>
        <a href="https://godoc.org/github.com/clivern/mammal">
            <img src="https://godoc.org/github.com/clivern/mammal?status.svg">
        </a>
        <a href="https://github.com/clivern/mammal/blob/master/LICENSE">
            <img src="https://img.shields.io/badge/LICENSE-MIT-E74C3C.svg">
        </a>
    </p>
</p>
<br/>


## Documentation

#### Linux Deployment

Download [the latest mammal binary](https://github.com/clivern/mammal/releases). Make it executable from everywhere.

```zsh
$ export LATEST_VERSION=$(curl --silent "https://api.github.com/repos/clivern/mammal/releases/latest" | jq '.tag_name' | sed -E 's/.*"([^"]+)".*/\1/' | tr -d v)

$ curl -sL https://github.com/clivern/mammal/releases/download/v{$LATEST_VERSION}/mammal_{$LATEST_VERSION}_Linux_x86_64.tar.gz | tar xz
```

Create the configs file `config.yml` from `config.dist.yml`. Something like the following:

```yaml
# App configs
app:
    # App name
    name: ${MAMMAL_APP_NAME:-mammal}
    # Env mode (dev or prod)
    mode: ${MAMMAL_APP_MODE:-dev}
    # HTTP port
    port: ${MAMMAL_API_PORT:-8000}
    # Hostname
    hostname: ${MAMMAL_API_HOSTNAME:-127.0.0.1}
    # TLS configs
    tls:
        status: ${MAMMAL_API_TLS_STATUS:-off}
        crt_path: ${MAMMAL_API_TLS_PEMPATH:-cert/server.crt}
        key_path: ${MAMMAL_API_TLS_KEYPATH:-cert/server.key}

    # Global timeout
    timeout: ${MAMMAL_API_TIMEOUT:-50}

    # Log configs
    log:
        # Log level, it can be debug, info, warn, error, panic, fatal
        level: ${MAMMAL_LOG_LEVEL:-info}
        # Output can be stdout or abs path to log file /var/logs/mammal.log
        output: ${MAMMAL_LOG_OUTPUT:-stdout}
        # Format can be json
        format: ${MAMMAL_LOG_FORMAT:-json}
```

The run the `mammal` with `systemd`

```zsh
$ mammal server -c /path/to/config.yml
```


#### Docker Deployment

To build and push the image to [docker hub registry](https://hub.docker.com/r/clivern/mammal).

```zsh
$ docker build -t clivern/mammal:v1.0.0 .
$ docker push clivern/mammal:v1.0.0
```

To pull and run the microservice.

```zsh
$ docker pull clivern/mammal:v1.0.0
$ docker run -d -p 8000:8000 clivern/mammal:v1.0.0
```


## Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, Mammal is maintained under the [Semantic Versioning guidelines](https://semver.org/) and release process is predictable and business-friendly.

See the [Releases section of our GitHub project](https://github.com/clivern/mammal/releases) for changelogs for each release version of Mammal. It contains summaries of the most noteworthy changes made in each release.


## Bug tracker

If you have any suggestions, bug reports, or annoyances please report them to our issue tracker at https://github.com/clivern/mammal/issues


## Security Issues

If you discover a security vulnerability within Mammal, please send an email to [hello@clivern.com](mailto:hello@clivern.com)


## Contributing

We are an open source, community-driven project so please feel free to join us. see the [contributing guidelines](CONTRIBUTING.md) for more details.


## License

© 2022, Clivern. Released under [MIT License](https://opensource.org/licenses/mit-license.php).

**Mammal** is authored and maintained by [@clivern](http://github.com/clivern).
