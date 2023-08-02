import Foundation
import Combine

/*:

In Combine, **Publishers** distributes elements to one or more Subscribers that it accepts, through the extension of Operators, to create data event chains.
*/

// Just - A publisher that emits an output to each subscriber just once, and then finishes.
let _ = Just("Hello Combine").sink { completion in
    print("completion : \(completion)")
} receiveValue: { receivedString in
    print("receiveValue = \(receivedString)")
}




// NotificationCenter publisher

let notification = Notification(name: .NSSystemClockDidChange, object: nil, userInfo: nil)
let clockNotificationPublisher = NotificationCenter.default.publisher(for: .NSSystemClockDidChange).sink { receivedNotification in
    print("value is : \(receivedNotification)")
}
NotificationCenter.default.post(notification)
