# BitBay Ticker

![Swift 5.1.3](https://img.shields.io/badge/Swift-5.1.3-orange.svg)
[![Build Status](https://travis-ci.org/albinekcom/BitBay-Ticker.svg?branch=master)](https://travis-ci.org/albinekcom/BitBay-Ticker)

This is a command line tool to receive ticker information using [BitBay Public Trading API](https://docs.bitbay.net/reference).

## Usage

Clone this repository and run with ticker name as a first argument and other print arguments.

```bash
$ git clone https://github.com/albinekcom/BitBay-Ticker.git
$ cd BitBay-Ticker
$ swift run BitBay-Ticker BTC-PLN --lowestAsk --rate
```

### Available first argument

If public trading API does not support a particular ticker, you will receive an appropriate message. The list of supported tickers can be found here: [Available Tickers](https://github.com/albinekcom/BitBay-API-Tools/blob/master/v1/available-tickers.json).

### Available print arguments

- `--highestBid`
- `--lowestAsk`
- `--rate`
- `--previousRate`
- `--highestRate`
- `--lowestRate`
- `--volume`
- `--average`
