
# docker-vertcoind

[![Build Status](https://travis-ci.org/lukechilds/docker-vertcoind.svg?branch=master)](https://travis-ci.org/lukechilds/docker-vertcoind)
[![Image Layers](https://images.microbadger.com/badges/image/lukechilds/vertcoind.svg)](https://microbadger.com/images/lukechilds/vertcoind)
[![Docker Pulls](https://img.shields.io/docker/pulls/lukechilds/vertcoind.svg)](https://hub.docker.com/r/lukechilds/vertcoind/)

> Run a full Jagoancoin node with one command

A Docker configuration with sane defaults for running a full
Vertcoin node.

## Usage

```
docker run -v /home/username/jagoancoin:/data -p 17899:17899 jagoanpilot/jagoancoind
```

If there's a `jagoancoin.conf` in the `/data` volume it'll be used. If not, one will be created for you with a randomly generated JSON-RPC password.

### JSON-RPC

To access JSON-RPC you'll also need to expose port 17898. You probably only want this available to localhost:

```
docker run -v /home/username/jagoancoin:/data -p 17899:17899 -p 127.0.0.1:17898:17898 jagoanpilot/jagoancoind
```

### CLI Arguments

All CLI arguments are passed directly through to jagoancoind.

You can use this to configure via CLI args without a config file:

```
docker run -v /home/username/jagoancoin:/data \
  -p 17899:17899 \
  -p 127.0.0.1:17898:17898 \
  jagoanpilot/jagoancoind -rpcuser=jonsnow -rpcpassword=ikn0wnothin
```

Or just use the container like a jagoancoind binary:

```
$ docker run jagoanpilot/jagoancoind -version
Jagoancoin Core Daemon version v0.11.1.0-9c5018b
Copyright (C) 2009-2017 The Vertcoin Core developers
Copyright (C) 2009-2017 The Bitcoin Core developers

Please contribute if you find Vertcoin Core useful. Visit
<https://vertcoin.org> for further information about the software.
The source code is available from <https://github.com/vertcoin/vertcoin>.

This is experimental software.
Distributed under the MIT software license, see the accompanying file COPYING
or <https://opensource.org/licenses/MIT>

This product includes software developed by the OpenSSL Project for use in the
OpenSSL Toolkit <https://www.openssl.org> and cryptographic software written by
Eric Young and UPnP software written by Thomas Bernard.
```

### Version

You can also run a specific version of jagoancoind if you want.

```
docker run -v /home/username/jagoancoin:/data -p 17899:17899 jagoanpilot/jagoancoind:v0.1
```

## License

MIT © Luke Childs
