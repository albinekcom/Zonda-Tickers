import Foundation

public struct EndpointFactory {

    private let valuesEndpointString = "https://api.bitbay.net/rest/trading/ticker/"
    private let statsEndpointString = "https://api.bitbay.net/rest/trading/stats/"
    
    public init() {}
    
}

extension EndpointFactory: EndpointFactoryPort {
    
    public func makeValuesURL(for tickerIdentifier: String) -> URL? {
        makeURL(tickerIdentifier: tickerIdentifier, endpointString: valuesEndpointString)
    }

    public func makeStatsURL(for tickerIdentifier: String) -> URL? {
        makeURL(tickerIdentifier: tickerIdentifier, endpointString: statsEndpointString)
    }

    private func makeURL(tickerIdentifier: String, endpointString: String) -> URL? {
        let composedString = "\(endpointString)\(tickerIdentifier)"

        return URL(string: composedString)
    }
    
}

public protocol EndpointFactoryPort {
    
    func makeValuesURL(for tickerIdentifier: String) -> URL?
    func makeStatsURL(for tickerIdentifier: String) -> URL?
    
}
