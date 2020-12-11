public struct TickerFactory {

    public func makeTicker(tickerIdenfitier: String, tickerValuesData: TickerValuesData, tickerStatsData: TickerStatsData) -> Ticker {
        Ticker(
            id: tickerIdenfitier,
            highestBid: tickerValuesData.highestBid,
            lowestAsk: tickerValuesData.lowestAsk,
            rate: tickerValuesData.rate,
            previousRate: tickerValuesData.previousRate,
            highestRate: tickerStatsData.highestRate,
            lowestRate: tickerStatsData.lowestRate,
            volume: tickerStatsData.volume,
            average: tickerStatsData.average
        )
    }

}
