import Combine
import Foundation
import UIKit

// Just : A publisher that emits an output to each subscriber just once, and then finishes.
let _ = Just("sample data").sink { strValue in
    print(strValue)
}


let subject = PassthroughSubject<Int, Never>()
let subscriber = subject.sink { num in
    print(num)
}
Just(100).subscribe(subject)


// Future : A publisher that eventually produces a single value and then finishes or fails.

enum FutureError: Error {
    case notMultiple
}

let future = Future<String, FutureError> { promise in
    let calendar = Calendar.current
    let second = calendar.component(.second, from: Date())
    print("second is \(second)")
    if second.isMultiple(of: 3){
        promise(.success("We are successful: \(second)"))
    }else{
        promise(.failure(.notMultiple))
    }
}.catch{error in
    Just("Caught the error")
}
.delay(for: .init(1), scheduler: RunLoop.main)
.eraseToAnyPublisher()

future.sink(receiveCompletion: {print($0)},
            receiveValue: {print($0)})
