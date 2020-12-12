public struct TickerPropertiesAPIErrorResponse: Codable {

    let status: String?
    let errors: [String]?

}

extension TickerPropertiesAPIErrorResponse {
    
    var isFail: Bool {
        status?.lowercased() == "fail"
    }
}
