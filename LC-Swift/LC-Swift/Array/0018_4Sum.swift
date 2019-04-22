//
//  0018_4Sum.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/22.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

注意：

答案中不可以包含重复的四元组。

示例：

给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。

满足要求的四元组集合为：
[
    [-1,  0, 0, 1],
    [-2, -1, 1, 2],
    [-2,  0, 0, 2]
]
*/

class FourSumSolution {
    
    // Time Complexity: O(n³) | Space Complexity: ?
    // Thought: 4数之和 = 1数 + 3数之和 = 1数 + 1数 + 2数之和
    //            先排序，再求值，注意去重即可
    // 执行用时 : 228 ms, 在4Sum的Swift提交中击败了55.17% 的用户
    // 内存消耗 : 19 MB, 在4Sum的Swift提交中击败了50.00% 的用户
    private func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        guard nums.count >= 4 else {
            return result
        }
        
        let _nums = nums.sorted()
        for i in 0..<_nums.count - 3 {
            if i > 0 && _nums[i] == _nums[i - 1] {
                continue
            }
            let threeSum = target - _nums[i]
            for j in i + 1..<_nums.count - 2 {
                // 此处条件判断 j > i + 1 是为了确保约束条件是作用于求3数之和的逻辑中。
                // 如果写成 j > 1，那么就相当于没有了这个条件，_nums[j] == _nums[j - 1]会在第一次循环时参与到上层循环的值当中。
                // 所有 nums[0] == nums[1] 相等的情况都会被过滤掉，比如 Testcase 结果中的 [-1, -1, 0, 1]。
                if j > i + 1 && _nums[j] == _nums[j - 1] {
                    continue
                }
                let twoSum = threeSum - _nums[j]
                var k = j + 1, p = _nums.count - 1
                while k < p {
                    let sum = _nums[k] + _nums[p]
                    if twoSum ==  sum {
                        result.append([_nums[i], _nums[j], _nums[k], _nums[p]])
                        repeat {
                            k += 1
                        } while k < p && _nums[k] == _nums[k - 1]
                        repeat {
                            p -= 1
                        } while k < p && _nums[p] == _nums[p + 1]
                    } else if twoSum > sum {
                        repeat {
                            k += 1
                        } while k < p && _nums[k] == _nums[k - 1]
                    } else {
                        repeat {
                            p -= 1
                        } while k < p && _nums[p] == _nums[p + 1]
                    }
                }
            }
        }
        return result
    }
    
    // Testcase: nums = [1, 0, -1, 0, -2, 2]，target = 0 -> [[-1,  0, 0, 1], [-2, -1, 1, 2], [-2,  0, 0, 2]]
    //             nums = [-1, 0, 1, 2, -1, -4], target = -1 -> [[-4, 0, 1, 2],[-1, -1, 0, 1]]
    func test() {
        print(fourSum([-1, 0, 1, 2, -1, -4], -1))
    }
}
