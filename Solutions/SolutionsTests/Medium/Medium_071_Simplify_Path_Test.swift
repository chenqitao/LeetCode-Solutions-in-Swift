//
//  Medium_071_Simplify_Path_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/28/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_071_Simplify_Path_Test: XCTestCase {
    private static let ProblemName: String = "Medium_071_Simplify_Path"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: String = "/..."
        let expected: String = "/..."
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = "/home/"
        let expected: String = "/home"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "/a/./b/../../c/"
        let expected: String = "/c"
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "/abc/..."
        let expected: String = "/abc/..."
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "/.."
        let expected: String = "/"
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: String = "/."
        let expected: String = "/"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: String, expected: String) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_071_Simplify_Path_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result = Medium_071_Simplify_Path.simplifyPath(input)
            assertHelper(result == expected, problemName: Medium_071_Simplify_Path_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_071_Simplify_Path_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_071_Simplify_Path_Test.ProblemName, input: input, resultValue: Medium_071_Simplify_Path_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
