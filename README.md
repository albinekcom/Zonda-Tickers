# Zonda Tickers

![Swift 5.5](https://img.shields.io/badge/Swift-5.5-orange.svg)
![macOS 12+](https://img.shields.io/badge/macOS-12+-lightgrey.svg)
[![Build Status](https://travis-ci.com/albinekcom/Zonda-Tickers.svg?branch=master)](https://travis-ci.com/albinekcom/Zonda-Tickers)

This is a command line tool to receive ticker information using [Zonda Public Trading API](https://docs.zonda.exchange/reference).

## Usage

Clone this repository and run with ticker names and print arguments.

```bash
$ git clone https://github.com/albinekcom/Zonda-Tickers.git
$ cd Zonda-Tickers
$ swift run Zonda-Tickers BTC-PLN ETH-PLN --lowestAsk --rate
```

### Available print arguments

- `--highestBid`
- `--lowestAsk`
- `--rate`
- `--previousRate`
- `--highestRate`
- `--lowestRate`
- `--volume`
- `--average`
