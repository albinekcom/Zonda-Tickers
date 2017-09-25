# BitBay Ticker

![Swift 4](https://img.shields.io/badge/Swift-4-orange.svg)
[![Build Status](https://travis-ci.org/albinekcom/BitBay-Ticker.svg?branch=master)](https://travis-ci.org/albinekcom/BitBay-Ticker)

This is a command line tool to receive ticker information using [BitBay Public API](https://www.bitbay.net/en/api-public).


## Usage

Clone this repository, build and execute with ticker name as a first argument and other print arguments.

```bash
$ git clone https://github.com/albinekcom/BitBay-Ticker.git
$ cd BitBay-Ticker
$ swift build
$ .build/debug/BitBay-Ticker BTCPLN --last --average
```

### Available first argument

- `BTCPLN`
- `BTCUSD`
- `BTCEUR`
- `LTCPLN`
- `LTCUSD`
- `LTCEUR`
- `LTCBTC`
- `ETHPLN`
- `ETHUSD`
- `ETHEUR`
- `ETHBTC`
- `LSKPLN`
- `LSKUSD`
- `LSKEUR`
- `LSKBTC`
- `BCCPLN`
- `BCCUSD`
- `BCCEUR`
- `BCCBTC`
- `DASHPLN`
- `DASHUSD`
- `DASHEUR`
- `DASHBTC`
- `GAMEPLN`
- `GAMEUSD`
- `GAMEEUR`
- `GAMEBTC`

### Available print arguments

- `--max`
- `--min`
- `--last`
- `--bid`
- `--ask`
- `--vwap`
- `--average`
- `--volume`
