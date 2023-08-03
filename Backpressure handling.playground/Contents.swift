import Foundation
import Combine

let cityPublisher = (["San Jose", "San Francisco", "Menlo Park", "Palo Alto", ]).publisher

final class CitySubscriber: Subscriber {
    typealias Input = String
    typealias Failure = Never
    
   func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("City : \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Subscription : \(completion)")
    }
}
//let citySubscription = cityPublisher
//    .sink { print($0) }

let citySubscription2 = CitySubscriber()
cityPublisher.subscribe(citySubscription2)


