import Foundation
import Combine

let numbers = (1...10)
    .publisher

let numbersTwo = (11...20)
    .publisher

let words = (21...40).compactMap { String($0) }
    .publisher

print("even numbers------")
let _ = numbers
    .filter {$0 % 2 == 0}
    .sink {print($0)}

print("convert to float-----")
let _ = numbers
    .compactMap{value in Float(value)}
    .sink {print($0)}

print("1st elemnent---------")
let _ = numbers
    .first()
    .sink {print($0)}

print("last element less than 10 -------------")
let _ = numbers
    .last(where: {$0 < 10 })
    .sink {print($0)}

print("dropFirst---------")
let _ = numbers
    .dropFirst()
    .sink {print($0)}

print("prefix elements based on index")
let _ = numbers
    .prefix(4)
    .sink {print($0)}

print("prefix elements based on condition")
let _ = numbers
    .prefix(while: {$0 < 5})
    .sink {print($0)}

print("append elements")
let _ = numbers
    .append(11,12,13)
    .sink {print($0)}

print("prepend elements")
let _ = numbers
    .prepend(21,22,23)
    .sink {print($0)}

print("merge with diff publisher")
let _ = numbers
    .merge(with: numbersTwo)
    .sink {print($0)}

print("Subscribes to an additional publisher and publishes a tuple upon receiving output from either publisher.")
let _ = numbers
    .combineLatest(words)
    .sink {print($0)}

print("Combines elements from another publisher and deliver pairs of elements as tuples.")
let _ = numbers
    .zip(numbersTwo)
    .sink {print($0)}


print("collect")
let _ = numbers
    .collect()
    .sink {print($0)}

print("Publishes either the most-recent or first element published by the upstream publisher in the specified time interval.")
let _ = numbers
    .throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true)
    .sink {print($0)}


print("drop while: {$0 % 3 == 0}")
let _ = numbers
    .drop(while: {$0 % 3 == 0} )
    .sink {print($0)}


/*
let cancellableSink = numbers
    //.filter {$0 % 2 == 0}
    //.compactMap{value in Float(value)}
    //.first()
    //.last(where: {$0 < 20 })
    //.dropFirst()
    //.drop(while: {$0 % 3 == 0} )
    //.prefix(4)
    //.prefix(while: {$0 < 5})
    //.append(21,22,23)
    //.prepend(21,22,23)
    //.merge(with: numbersTwo)
    //.combineLatest(words)
    //.zip(numbersTwo)
    //.collect()
    //.throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true)
    .sink {print($0)}
*/
