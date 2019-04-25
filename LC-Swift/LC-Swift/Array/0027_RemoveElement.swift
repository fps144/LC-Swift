//
//  0027_RemoveElement.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/25.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个数组 nums 和一个值 val，你需要原地移除所有数值等于 val 的元素，返回移除后数组的新长度。
 
 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 
 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
 
 示例 1:
 
 给定 nums = [3,2,2,3], val = 3,
 
 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。
 
 你不需要考虑数组中超出新长度后面的元素。
 示例 2:
 
 给定 nums = [0,1,2,2,3,0,4,2], val = 2,
 
 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。
 
 注意这五个元素可为任意顺序。
 
 你不需要考虑数组中超出新长度后面的元素。
 */

class RemoveElementSolution {
    
    // Time Complexity: O(n - m) | Space Complexity: O(1)
    // Thought: 记录当前操作值的 index 即可，满足 nums[nowIndex] == val 则从数据源中移除 nowIndex 对应的值，否则 ++nowIndex。
    // 执行用时 : 20 ms, 在Remove Element的Swift提交中击败了84.53% 的用户
    // 内存消耗 : 18.3 MB, 在Remove Element的Swift提交中击败了97.40% 的用户
    private func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var nowIndex = 0
        while nowIndex < nums.count {
            if nums[nowIndex] == val {
                nums.remove(at: nowIndex)
            } else {
                nowIndex += 1
            }
        }
        return nums.count
    }
    
    // Testcase: [0,1,2,2,3,0,4,2], 2 -> 5
    func test(){
        var testArr = [0,1,2,2,3,0,4,2]
        print(removeElement(&testArr, 2))
    }
    
}
