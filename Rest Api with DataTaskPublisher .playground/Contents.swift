import Combine
import Foundation

struct Post: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let samplePost = Post(userId: 1, id: 2, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")

let publisher = URLSession.shared.dataTaskPublisher(for: url!).map{$0.data}.decode(type: [Post].self, decoder: JSONDecoder())

let cancellableSink = publisher.sink { completion in
    print(String(describing: completion))
} receiveValue: { posts in
    print("posts: \(posts)")
    print("------")
    print(type(of: posts.first))
}

