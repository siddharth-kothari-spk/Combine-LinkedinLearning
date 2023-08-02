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
subject.send(150) // works
subject.send(175) // works

// connect subject to publisher
Just(200).subscribe(subject)
//subject.send(300) // does not work


// currentValueSubject
let anotherSubject = CurrentValueSubject<String, Never>("1st value")

let anotherSubscriber = anotherSubject.sink { stringValue in
    print(stringValue) // gives both previous value and new value
}
anotherSubject.send("2nd value")

