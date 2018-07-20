# BitBay Ticker

![Swift 4.1](https://img.shields.io/badge/Swift-4.1-orange.svg)
[![Build Status](https://travis-ci.org/albinekcom/BitBay-Ticker.svg?branch=master)](https://travis-ci.org/albinekcom/BitBay-Ticker)

This is a command line tool to receive ticker information using [BitBay Public API](https://www.bitbay.net/en/api-public).

## Usage

Clone this repository and run with ticker name as a first argument and other print arguments.

```bash
$ git clone https://github.com/albinekcom/BitBay-Ticker.git
$ cd BitBay-Ticker
$ swift run BitBay-Ticker BTCPLN --last --average
```

### Available first argument

| Bitcoin  | Litecoin | Ethereum | Lisk     | Bitcoin Cash | Dash      | Game      | Bitcoin Gold | KZCash   | Ripple   | Infinity Economics | Monero   | Zcash    | Golem    | OmiseGO  |
|----------|----------|----------|----------|--------------|-----------|-----------|--------------|----------|----------|--------------------|----------|----------|----------|----------|
| `BTCPLN` | `LTCPLN` | `ETHPLN` | `LSKPLN` | `BCCPLN`     | `DASHPLN` | `GAMEPLN` | `BTGPLN`     | `KZCPLN` | `XRPPLN` | `XINPLN`           | `XMRPLN` | `ZECPLN` | `GNTPLN` | `OMGPLN` |
| `BTCUSD` | `LTCUSD` | `ETHUSD` | `LSKUSD` | `BCCUSD`     | `DASHUSD` | `GAMEUSD` | `BTGUSD`     | `KZCUSD` | `XRPEUR` | `XINEUR`           | `XMREUR` | `ZECEUR` | `GNTEUR` | `OMGEUR` |
| `BTCEUR` | `LTCEUR` | `ETHEUR` | `LSKEUR` | `BCCEUR`     | `DASHEUR` | `GAMEEUR` | `BTGEUR`     | `KZCEUR` | `XRPUSD` | `XINUSD`           | `XMRUSD` | `ZECUSD` | `GNTUSD` | `OMGUSD` |
|          | `LTCBTC` | `ETHBTC` | `LSKBTC` | `BCCBTC`     | `DASHBTC` | `GAMEBTC` | `BTGBTC`     | `KZCBTC` | `XRPBTC` | `XINBTC`           | `XMRBTC` | `ZECBTC` | `GNTBTC` | `OMGBTC` |

### Available print arguments

- `--max`
- `--min`
- `--last`
- `--bid`
- `--ask`
- `--vwap`
- `--average`
- `--volume`
