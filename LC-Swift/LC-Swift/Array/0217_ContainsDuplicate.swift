//
//  0217_ContainsDuplicate.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/9.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数数组，判断是否存在重复元素。
 
 如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: true
 
 示例 2:
 
 输入: [1,2,3,4]
 输出: false
 
 示例 3:
 
 输入: [1,1,1,3,3,4,3,2,4,2]
 输出: true
 */

class ContainsDuplicate {
    
//    // TimeComplexity: O(nlog n) | SpaceComplexity: O(n)
//    // Thought: 先排序，如果相邻有相等，则存在重复数，反之则不存在。
//    // 执行用时 : 344 ms, 在Contains Duplicate的Swift提交中击败了28.49% 的用户
//    // 内存消耗 : 19 MB, 在Contains Duplicate的Swift提交中击败了100.00% 的用户
//    private func containsDuplicate(_ nums: [Int]) -> Bool {
//        guard nums.count > 0 else {
//            return false
//        }
//        let nums = nums.sorted()
//        var contains = false
//        for index in 0..<nums.count - 1 {
//            if nums[index] == nums[index + 1] {
//                contains = true
//                break;
//            }
//        }
//        return contains
//    }
    
    // TimeComplexity: O(n) | SpaceComplexity: O()
    // Thought: 不排序，采用 Set 来管理存在的数，如果下一个操作数在 Set 中，则说明有重复。
    //          这里如果用 Array 的话会超时，目测 Set 直接采用索引取值，而 Array 要遍历。
    // 执行用时 : 236 ms, 在Contains Duplicate的Swift提交中击败了68.16% 的用户
    // 内存消耗 : 20.2 MB, 在Contains Duplicate的Swift提交中击败了57.47% 的用户
    private func containsDuplicate(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else {
            return false
        }
        var tmp = Set<Int>()
        for num in nums {
            if tmp.contains(num) {
                return true
            } else {
                tmp.insert(num)
            }
        }
        return false
    }
    
    // Testcase: [1,1,1,3,3,4,3,2,4,2] -> true
    func test() {
        print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
    }
}
