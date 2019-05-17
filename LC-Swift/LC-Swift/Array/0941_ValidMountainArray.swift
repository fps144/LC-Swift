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
 A[i] > A[i+1] > ... > A[A.length - 1]
 
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
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 用 foundPeak 记录是否找到山峰的状态。
    //          几个条件：1.山峰不能位于首尾 2.不能有连续相等的山峰 3.山峰右侧必须都小于山峰，且不能出现新山峰 (即找到山峰后不能出现 A[index] < A[index + 1] 的情况)
    // 执行用时 : 324 ms, 在Valid Mountain Array的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 20.6 MB, 在Valid Mountain Array的Swift提交中击败了33.33% 的用户
    private func validMountainArray(_ A: [Int]) -> Bool {
        guard A.count >= 3 else {
            return false
        }
        var result = false
        var foundPeak = false
        for index in 0..<A.count - 1 {
            if (index == 0 && A[index] > A[index + 1]) || A[index] == A[index + 1]  { break }
            if A[index] < A[index + 1] {
                if foundPeak || index == A.count - 2 { break }
            } else {
                foundPeak = true
                if index == A.count - 2 { result = true }
            }
        }
        return result
    }
    
    // Testcase: [0,3,2,1] -> true
    func test() {
        print(validMountainArray([0,3,2,1]))
    }
}
