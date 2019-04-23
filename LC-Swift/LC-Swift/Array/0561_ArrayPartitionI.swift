//
//  0561_ArrayPartitionI.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/23.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定长度为 2n 的数组, 你的任务是将这些数分成 n 对, 例如 (a1, b1), (a2, b2), ..., (an, bn) ，使得从1 到 n 的 min(ai, bi) 总和最大。
 
 示例 1:
 
 输入: [1,4,3,2]
 
 输出: 4
 解释: n 等于 2, 最大总和为 4 = min(1, 2) + min(3, 4).
 提示:
 
 n 是正整数,范围在 [1, 10000].
 数组中的元素范围在 [-10000, 10000].
 */
class ArrayPartitionISolution {
    
    // Time Complexity: O(n logn) | Space Complexity: O(1)
    // Thought: 升序排序 + 隔一个取一个求和
    // 执行用时 : 780 ms, 在Array Partition I的Swift提交中击败了39.62% 的用户 （但比第一快)
    // 内存消耗 : 19.3 MB, 在Array Partition I的Swift提交中击败了43.90% 的用户
    private func arrayPairSum(_ nums: [Int]) -> Int {
        let _nums = nums.sorted()
        var sum = 0
        var index = 0
        while index < _nums.count - 1 {
            sum += _nums[index]
            index += 2
        }
        return sum
    }
    
    // Testcase: [1,4,3,2] -> 4
    func test() {
        print(arrayPairSum([1,4,3,2]))
    }
}
