# Rotonde CLI

Easy get up and running with rotonde.

_currently only compatible with raspberryPI_

## Installation

ssh to your raspberryPI and run this command:

```sh
curl -sL https://raw.githubusercontent.com/HackerLoop/rotonde-cli/master/install_rpi.sh | bash -E -
```

This script might reboot your raspberryPI, please repeat previous
instruction on reboot.

## Usage

### Install modules

```sh
rotonde install [module name]
```

Note about modules: they are hosted on docker hub, which means that they are in the form of [author]/[module]. The name given here should not contain the platform suffix, (ie. -rpi) which is automatically added by the script. This lack of proper UX will remain until we have a better method.

For exemple, to install the rotonde-serial module, which is hosted by
the user hackerloop on docker hub as `hackerloop/rotonde-serial-rpi`:

```sh
rotonde install hackerloop/rotonde-serial
```

### Update modules

```sh
rotonde update [module name]
```

### Remove modules

```sh
rotonde remove [module name]
```

### Searching modules

Go to the docker hub [search page](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=rotonde&starCount=0).

remember that you should not add the platform suffix that you see in the
docker hub (ie. -rpi for raspberryPI images).
