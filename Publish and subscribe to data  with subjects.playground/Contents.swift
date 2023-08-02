import Foundation
import Combine

// declare an int passThroughSubject
let subject = PassthroughSubject<Int, Never>()

// attach subscriber to subject
let subscriber = subject.sink { num in
    print(num)
}

// publish value via subkect
subject.send(100)


