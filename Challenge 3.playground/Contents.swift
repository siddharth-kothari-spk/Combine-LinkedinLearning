import Foundation
import Combine

var queue: DispatchQueue = DispatchQueue(label: "Queue")

let numberPublisher = (0...100)
    .publisher.delay(for: 2.0, scheduler: queue)


final class CustomSubscriber: Subscriber {
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Number: \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Subscription \(completion)")
    }
    
    typealias Input = Int
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.max(5))
    }
}

let subscription = CustomSubscriber()
numberPublisher.subscribe(subscription)
