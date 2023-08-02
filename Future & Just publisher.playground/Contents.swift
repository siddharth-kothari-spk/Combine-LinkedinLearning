import Combine
import Foundation

// Just : A publisher that emits an output to each subscriber just once, and then finishes.
let _ = Just("sample data").sink { strValue in
    print(strValue)
}
