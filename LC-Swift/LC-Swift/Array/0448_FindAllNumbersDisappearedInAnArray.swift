//
//  0448_FindAllNumbersDisappearedInAnArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/9.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。
 
 找到所有在 [1, n] 范围之间没有出现在数组中的数字。
 
 您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。
 
 示例:
 
 输入:
 [4,3,2,7,8,2,3,1]
 
 输出:
 [5,6]
 */

class FindAllNumbersDisappearedInAnArraySolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(n)
    // Thought: 值比索引大1，所以当一个值为 a 的数出现时，就将它索引 a - 1 对应的值置为0。
    //          最后遍历数组，找出所有不为0的值(即未出现过)，取其 index + 1 即可。
    // 执行用时 : 860 ms, 在Find All Numbers Disappeared in an Array的Swift提交中击败了45.83% 的用户
    // 内存消耗 : 20.1 MB, 在Find All Numbers Disappeared in an Array的Swift提交中击败了64.71% 的用户
    private func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var _nums = nums
        for index in nums.indices {
            let valueMappedIndex = nums[index] - 1
            _nums[valueMappedIndex] = 0
        }
        for index in _nums.indices {
            if _nums[index] != 0 {
                result.append(index + 1)
            }
        }
        return result
    }
    
    // Testcase: [4,3,2,7,8,2,3,1] -> [5,6]
    func test() {
        print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))
    }
}
