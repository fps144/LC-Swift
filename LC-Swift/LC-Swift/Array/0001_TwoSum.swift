//
//  0001_TwoSum.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 [2,7,11,15]
 9
 */

class TwoSumSoluton {
//    private func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
//        // Time Out!!!
//        // Time Complexity: O(n²) Space Complexity: O(n)
//        // Thought: 遍历数据源，检查数据源中是否存在两个值，一个是游标值 num，另一个是 target - num。因为不能重复利用相同元素，所以从首尾分别取第一个值，使其满足上面的关系，将符合条件的 index 放入数组返回。
//        // Reason: 遍历数据源时每循环一次都要再次遍历两遍数据源，耗时严重。
//        // Proposals：减少数据源遍历次数，根据题目中 value 和 index 的关系，可以尝试建立 value 和 index 的映射。
//        var result = [Int]()
//        for num in nums {
//            let lastIndex = nums.firstIndex(of: num)
//            let firstIndex = nums.lastIndex(of: target - num)
//            if firstIndex != nil && firstIndex! != lastIndex! {
//                result = [firstIndex!, lastIndex!]
//                break
//            }
//        }
//        return result
//    }
    
    // Time Complexity: O(n) Space Complexity: O(n)
    // Thought：遍历数据源，取游标值 num，只要满足 target - num 依然在数据源中，且 target - num 和 num 并非同一 index 即可。可以建立 value 和 index 的映射，先判断，后添加 value - index。
    private func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var valueIndexMap = [Int: Int]()
        for (firstIndex, value) in nums.enumerated() {
            if let lastIndex = valueIndexMap[target - value] {
                result = [firstIndex, lastIndex]
                break
            }
            valueIndexMap[value] = firstIndex
        }
        
        return result
    }
    
    /// Two Sum
    ///
    /// Testcase: [2,7,11,15] 9
    func twoSumTest() {
        print(twoSum([2, 7, 11, 15], 9))
    }
}
