import Combine
import Foundation

// Just : A publisher that emits an output to each subscriber just once, and then finishes.
let _ = Just("sample data").sink { strValue in
    print(strValue)
}


let subject = PassthroughSubject<Int, Never>()
let subscriber = subject.sink { num in
    print(num)
}
Just(100).subscribe(subject)
