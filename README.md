# BitBay Ticker

![Swift 5.3](https://img.shields.io/badge/Swift-5.3-orange.svg)
[![Build Status](https://travis-ci.org/albinekcom/BitBay-Ticker.svg?branch=master)](https://travis-ci.org/albinekcom/BitBay-Ticker)
[![codecov](https://codecov.io/gh/albinekcom/BitBay-Ticker/branch/master/graph/badge.svg?token=kzbdtJy7IW)](https://codecov.io/gh/albinekcom/BitBay-Ticker)

This is a command line tool to receive ticker information using [BitBay Public Trading API](https://docs.bitbay.net/reference).

## Usage

Clone this repository and run with ticker name as a first argument and other print arguments.

```bash
$ git clone https://github.com/albinekcom/BitBay-Ticker.git
$ cd BitBay-Ticker
$ swift run BitBay-Ticker BTC-PLN --lowestAsk --rate
```

### Available first argument

If public trading API does not support a particular ticker, you will receive an appropriate message. The list of supported tickers can be found here: [Supported Tickers](https://github.com/albinekcom/BitBay-API-Tools/blob/master/v1/supported-tickers.json).

### Available print arguments

- `--highestBid`
- `--lowestAsk`
- `--rate`
- `--previousRate`
- `--highestRate`
- `--lowestRate`
- `--volume`
- `--average`
