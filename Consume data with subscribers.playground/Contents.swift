import UIKit
import Foundation
import Combine
import SwiftUI

[1,2,3,4].publisher.sink { value in
    print(value)
}

let label = UILabel()
Just("Sid")
    .map { str in
        "My name is \(str)"
    }.assign(to: \.text, on: label)

