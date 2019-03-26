# BitBay Ticker

![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Build Status](https://travis-ci.org/albinekcom/BitBay-Ticker.svg?branch=master)](https://travis-ci.org/albinekcom/BitBay-Ticker)

This is a command line tool to receive ticker information using [BitBay Public API](https://bitbay.net/en/api-public).

## Usage

Clone this repository and run with ticker name as a first argument and other print arguments.

```bash
$ git clone https://github.com/albinekcom/BitBay-Ticker.git
$ cd BitBay-Ticker
$ swift run BitBay-Ticker BTC/PLN --last --average
```

### Available first argument

If Public API does not support a particular ticker, you will receive an appropriate message. The list of supported tickers can be found here: [Available Tickers](https://github.com/albinekcom/BitBay-API-Tools/blob/master/v1/available-tickers.json).

### Available print arguments

- `--max`
- `--min`
- `--last`
- `--bid`
- `--ask`
- `--vwap`
- `--average`
- `--volume`
