//
//  0581_ShortestUnsortedContinuousSubarray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数数组，你需要寻找一个连续的子数组，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。
 
 你找到的子数组应是最短的，请输出它的长度。
 
 示例 1:
 
 输入: [2, 6, 4, 8, 10, 9, 15]
 输出: 5
 解释: 你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
 
 说明 :
 
 输入的数组长度范围在 [1, 10,000]。
 输入的数组可能包含重复元素 ，所以升序的意思是<=。
 */

class ShortestUnsortedContinuousSubarraySolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 先升序排序，再分别从头尾找出第一个与原数组不相等的值的位置，如果两个值相等(均为0)，则说明没有符合条件的子数组，长度为0；如果不等，则两个 index 的距离即为答案。
    // 执行用时 : 488 ms, 在Shortest Unsorted Continuous Subarray的Swift提交中击败了60.00% 的用户
    // 内存消耗 : 21.3 MB, 在Shortest Unsorted Continuous Subarray的Swift提交中击败了20.00% 的用户
    private func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var startIndex = 0
        var endIndex = 0
        let sortedNums = nums.sorted()
        for i in nums.indices {
            if nums[i] != sortedNums[i] {
                startIndex = i
                break
            }
        }
        for j in stride(from: nums.count - 1, to: 0, by: -1) {
            if nums[j] != sortedNums[j] {
                endIndex = j
                break
            }
        }
        return startIndex == endIndex ? 0 : endIndex - startIndex + 1
    }
    
    // Testcase: [2,6,4,8,10,9,15] -> 5 | [1,3,2,2,2] -> 4 | [1,3,2,3,3] -> 2
    func test() {
        print(findUnsortedSubarray([2,6,4,8,10,9,15]))
    }
}
