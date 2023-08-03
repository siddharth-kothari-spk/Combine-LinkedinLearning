import Foundation
import Combine

struct Post: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map {$0.data}
    .decode(type: Array<Post>.self, decoder: JSONDecoder())
    .eraseToAnyPublisher()
// without - Declaration

//let publisher: Publishers.Decode<Publishers.Map<URLSession.DataTaskPublisher, JSONDecoder.Input>, [Post], JSONDecoder>
//(1) Add `.eraseToAnyPublisher()`

let cancellableSink = publisher
    .sink(receiveCompletion: {completion in
        print(String(describing: completion))
    }, receiveValue: {value in
        print("returned value \(value)")
    })


