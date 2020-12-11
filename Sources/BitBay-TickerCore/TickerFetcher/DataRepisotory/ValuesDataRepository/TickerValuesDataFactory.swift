public struct TickerValuesDataFactory {

    public func makeTickerValuesData(from valuesAPIDataResponse: TickerValuesAPIDataResponse) -> TickerValuesData {
        TickerValuesData(
            highestBid: valuesAPIDataResponse.ticker?.highestBid?.doubleValue,
            lowestAsk: valuesAPIDataResponse.ticker?.lowestAsk?.doubleValue,
            rate: valuesAPIDataResponse.ticker?.rate?.doubleValue,
            previousRate: valuesAPIDataResponse.ticker?.previousRate?.doubleValue
        )
    }

}
