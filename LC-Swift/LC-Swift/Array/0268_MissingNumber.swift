//
//  0268_MissingNumber.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/8.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。
 
 示例 1:
 
 输入: [3,0,1]
 输出: 2
 
 示例 2:
 
 输入: [9,6,4,2,3,5,7,0,1]
 输出: 8
 
 说明:
 你的算法应具有线性时间复杂度。你能否仅使用额外常数空间来实现?
 */

class MissingNumberSolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(1)
    // Thought: 注意审题， 0..n 中 n 个数的序列，即 n 是数组元素个数，不是数组中的最大值。所以 缺失数字 = 1到n等差数列求和 - 已给数组元素的和
    // 执行用时 : 216 ms, 在Missing Number的Swift提交中击败了79.10% 的用户
    // 内存消耗 : 19.1 MB, 在Missing Number的Swift提交中击败了25.00% 的用户
    private func missingNumber(_ nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }
        return (1 + nums.count) * nums.count / 2 - sum
    }
    
    // Testcase: [9,6,4,2,3,5,7,0,1] -> 8
    func test() {
        print(missingNumber([0]))
    }
}
