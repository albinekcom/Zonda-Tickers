public struct TickerStatsDataFactory {

    public func makeTickerStatsData(from statsAPIDataResponse: TickerStatsAPIDataResponse) -> TickerStatsData {
        TickerStatsData(
            highestRate: statsAPIDataResponse.stats?.h?.doubleValue,
            lowestRate: statsAPIDataResponse.stats?.l?.doubleValue,
            volume: statsAPIDataResponse.stats?.v?.doubleValue,
            average: statsAPIDataResponse.stats?.r24h?.doubleValue
        )
    }

}
