//
//  0896_MonotonicArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/9.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 如果数组是单调递增或单调递减的，那么它是单调的。
 
 如果对于所有 i <= j，A[i] <= A[j]，那么数组 A 是单调递增的。 如果对于所有 i <= j，A[i]> = A[j]，那么数组 A 是单调递减的。
 
 当给定的数组 A 是单调数组时返回 true，否则返回 false。
 
 示例 1：
 
 输入：[1,2,2,3]
 输出：true
 
 示例 2：
 
 输入：[6,5,4,4]
 输出：true
 
 示例 3：
 
 输入：[1,3,2]
 输出：false
 
 示例 4：
 
 输入：[1,2,4,5]
 输出：true
 
 示例 5：
 
 输入：[1,1,1]
 输出：true
 
 提示：
 
 1 <= A.length <= 50000
 -100000 <= A[i] <= 100000
 */

class MonotonicArraySolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(1)
    // Thought: 在第一次出现 nums[index + 1] != nums[index] 时判定整个序列应有的单调性。
    // 执行用时 : 748 ms, 在Monotonic Array的Swift提交中击败了89.47% 的用户
    // 内存消耗 : 19.4 MB, 在Monotonic Array的Swift提交中击败了50.00% 的用户
    private func isMonotonic(_ A: [Int]) -> Bool {
        guard A.count > 2 else {
            return true
        }
        var isIncreasing = false;
        var judged = false;
        for index in 0..<A.count - 1 {
            if A[index] == A[index + 1] {
                continue
            }
            if !judged {
                isIncreasing = A[index + 1] - A[index] > 0
                judged = !judged
            }
            if isIncreasing {
                if A[index + 1] < A[index] {
                    return false
                }
            } else {
                if A[index + 1] > A[index] {
                    return false
                }
            }
        }
        return true
    }
    
    // Testcase: [1,3,2] -> false | [1,1,1] -> true
    func test() {
        print(isMonotonic([1,1,1]))
    }
}
