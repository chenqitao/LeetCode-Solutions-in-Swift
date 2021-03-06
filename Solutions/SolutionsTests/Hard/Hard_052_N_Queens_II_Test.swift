//
//  Hard_052_N_Queens_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/26/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_052_N_Queens_II_Test: XCTestCase {
    private static let ProblemName: String = "Hard_052_N_Queens_II"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 100
    func test_001() {
        var expected: [Int] = [0, 1, 0, 0, 2, 10, 4, 40, 92, 352, 724, 2680, 14200, 73712, 365596, 2279184, 14772512, 95815104, 666090624]
        for i in 0 ..< 14 {
            asyncHelper(input: i, expected: expected[i])
        }
    }
    private func asyncHelper(input  input: Int, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_052_N_Queens_II_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result = Hard_052_N_Queens_II.totalNQueens(input)
            assertHelper(result == expected, problemName: Hard_052_N_Queens_II_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_052_N_Queens_II_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_052_N_Queens_II_Test.ProblemName, input: input, resultValue: Hard_052_N_Queens_II_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
