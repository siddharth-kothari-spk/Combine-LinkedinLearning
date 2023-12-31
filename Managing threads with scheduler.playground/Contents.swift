import Foundation
import Combine

struct Post: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

print("Publisher: On main thread?: \(Thread.current.isMainThread)")
print("Publisher: thread info: \(Thread.current)")

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let queue = DispatchQueue(label: "a queue")

let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map {$0.data}
    .decode(type: Array<Post>.self, decoder: JSONDecoder())
    //.subscribe(on: queue)

let cancellableSink = publisher
    .receive(on: queue)
    //.receive(on: DispatchQueue.main)
    //.receive(on: DispatchQueue.global)
    .sink(receiveCompletion: {completion in
        print("Subscriber: On main thread?: \(Thread.current.isMainThread)")
        print("Subscriber: thread info: \(Thread.current)")
    }, receiveValue: {value in
        print("Subscriber: On main thread?: \(Thread.current.isMainThread)")
        print("Subscriber: thread info: \(Thread.current)")
    })

