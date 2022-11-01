import SwiftUI

extension Text {
    init(_ number: Double) {
        self.init(Int(number.rounded()))
    }

    init(_ number: Int) {
        self.init(String(number))
    }
}
