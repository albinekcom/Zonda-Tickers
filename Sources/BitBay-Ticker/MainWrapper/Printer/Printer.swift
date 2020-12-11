import Foundation

struct Printer {}

extension Printer: PrinterPort {
    
    func invokePrint(string: String) {
        print(string)
    }
    
}

protocol PrinterPort {
    
    func invokePrint(string: String)
    
}
