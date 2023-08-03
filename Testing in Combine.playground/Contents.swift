import XCTest
import Combine
import Foundation


class MyTests : XCTestCase {
    var subscriptions = Set<AnyCancellable>()
    let expectedTitle = "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
    let expectedId = 1
    
    func testPublisher() {

    }
}

//Courtesy of [NSScreenCast](https://github.com/nsscreencast/330-using-xctest-in-playgrounds)
class TestObserver : NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
        print("🚫 \(description) line:\(lineNumber)")
    }
    
    func testCaseDidFinish(_ testCase: XCTestCase) {
        if testCase.testRun?.hasSucceeded == true {
            print("✅ \(testCase)")
        }
    }
}

let observer = TestObserver()
XCTestObservationCenter.shared.addTestObserver(observer)

MyTests.defaultTestSuite.run()
