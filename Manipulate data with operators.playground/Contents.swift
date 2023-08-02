import Foundation
import Combine

// using map

[1,2,3,4].publisher.map { num in
    num * num
}.sink { modifiedValue in
    print("modifiedValue = \(modifiedValue)")
}

// using decode() with map() to convert REST api response to an object
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")

struct Post: Decodable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
}

let dataPublisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map{$0.data}
    .decode(type: [Post].self, decoder: JSONDecoder())

let cancellableSink = dataPublisher.sink { completion in
    print(completion)
} receiveValue: { posts in
    for post in posts {
        print(post)
    }
}

