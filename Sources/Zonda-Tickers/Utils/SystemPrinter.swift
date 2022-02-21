protocol Printer {
    
    static func display(text: String)
    
}

struct SystemPrinter: Printer {
    
    static func display(text: String) {
        print(text)
    }
    
}
