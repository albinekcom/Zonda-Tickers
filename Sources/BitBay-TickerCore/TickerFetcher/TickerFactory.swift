public struct TickerFactory {

    public func makeTicker(tickerIdenfitier: String, tickerValuesAPIData: TickerValuesAPIDataResponse, tickerStatsAPIData: TickerStatsAPIDataResponse) -> Ticker {
        Ticker(
            id: tickerIdenfitier,
            highestBid: tickerValuesAPIData.ticker?.highestBid?.doubleValue,
            lowestAsk: tickerValuesAPIData.ticker?.lowestAsk?.doubleValue,
            rate: tickerValuesAPIData.ticker?.rate?.doubleValue,
            previousRate: tickerValuesAPIData.ticker?.previousRate?.doubleValue,
            highestRate: tickerStatsAPIData.stats?.h?.doubleValue,
            lowestRate: tickerStatsAPIData.stats?.l?.doubleValue,
            volume: tickerStatsAPIData.stats?.v?.doubleValue,
            average: tickerStatsAPIData.stats?.r24h?.doubleValue
        )
    }

}
