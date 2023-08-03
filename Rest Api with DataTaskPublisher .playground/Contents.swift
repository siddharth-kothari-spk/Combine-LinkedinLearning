import Combine
import Foundation

struct Post: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum APIError: Error{
    case networkError(error: String)
    case responseError(error: String)
    case unknownError
}

let samplePost = Post(userId: 1, id: 2, title: "No Post", body: "")

let url = URL(string: "https://1jsonplaceholder.typicode.com/posts")

let publisher = URLSession.shared.dataTaskPublisher(for: url!).map{$0.data}.decode(type: [Post].self, decoder: JSONDecoder())

let cancellableSink = publisher
    .mapError({ error -> Error in
    switch error {
    case URLError.cannotFindHost:
        print("Error: \(error)")
        return APIError.networkError(error: error.localizedDescription)
    default:
        print("Error: \(error)")
        return APIError.responseError(error: error.localizedDescription)
    }
}).sink { completion in
    print(String(describing: completion))
} receiveValue: { posts in
    print("posts: \(posts)")
    print("------")
    print(type(of: posts.first))
}

