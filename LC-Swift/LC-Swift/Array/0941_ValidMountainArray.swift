//
//  0941_ValidMountainArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数数组 A，如果它是有效的山脉数组就返回 true，否则返回 false。
 
 让我们回顾一下，如果 A 满足下述条件，那么它是一个山脉数组：
 
 A.length >= 3
 在 0 < i < A.length - 1 条件下，存在 i 使得：
 A[0] < A[1] < ... A[i-1] < A[i]
 A[i] > A[i+1] > ... > A[B.length - 1]
 
 示例 1：
 
 输入：[2,1]
 输出：false
 
 示例 2：
 
 输入：[3,5,5]
 输出：false
 
 示例 3：
 
 输入：[0,3,2,1]
 输出：true
 
 提示：
 
 0 <= A.length <= 10000
 0 <= A[i] <= 10000
 */

class ValidMountainArraySolution {
    
    private func validMountainArray(_ A: [Int]) -> Bool {
        return false
    }
    
    // Testcase: [0,3,2,1] -> true
    func test() {
        print(validMountainArray([0,3,2,1]))
    }
}
