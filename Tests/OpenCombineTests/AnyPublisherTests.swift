//
//  AnyPublisherTests.swift
//  
//
//  Created by Sergej Jaskiewicz on 16.06.2019.
//

import XCTest

#if OPENCOMBINE_COMPATIBILITY_TEST
import Combine
#else
import OpenCombine
#endif

@available(macOS 10.15, *)
final class AnyPublisherTests: XCTestCase {

    static let allTests = [
        ("testErasePublisher", testErasePublisher),
    ]

    private typealias Sut = AnyPublisher<Int, TestingError>

    func testErasePublisher() {

        let publisher = TrackingSubject<Int>()
        let erased = AnyPublisher(publisher)
        let subscriber = TrackingSubscriber()

        erased.receive(subscriber: subscriber)
        XCTAssertEqual(publisher.history, [.subscriber(subscriber.combineIdentifier)])
    }
}
