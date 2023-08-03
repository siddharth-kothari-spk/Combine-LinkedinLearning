import UIKit
import Combine
import Foundation


struct Post: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")


let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map{$0.data}
    .decode(type: [Post].self, decoder: JSONDecoder())
    .map{$0.first}
    .compactMap({$0?.title})


let cancellableSink = publisher.sink { completion in
    print(completion)
} receiveValue: { value in
    print(value)
}

