//
//  0026_RemoveDuplicatesFromSortedArray.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/22.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
 
 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 
 示例 1:
 
 给定数组 nums = [1,1,2],
 
 函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
 
 你不需要考虑数组中超出新长度后面的元素。
 示例 2:
 
 给定 nums = [0,0,1,1,1,2,2,3,3,4],
 
 函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
 
 你不需要考虑数组中超出新长度后面的元素。
 */

class RemoveDuplicatesFromSortedArray {
    
//    // Time Complexity: O(n²) | Space Complexity: O(1)
//    // Thought: 相邻指针去重，只需判断好边界条件即可。
//    // 执行用时 : 224 ms, 在Remove Duplicates from Sorted Array的Swift提交中击败了11.85% 的用户
//    // 内存消耗 : 19.5 MB, 在Remove Duplicates from Sorted Array的Swift提交中击败了17.72% 的用户
//    // TODO: 提高速度 & 减少内存消耗
//    private func removeDuplicates(_ nums: inout [Int]) -> Int {
//        guard nums.count > 0 else {
//            return 0
//        }
//        var nowIndex = 0
//        while nowIndex < nums.count - 1 {
//            while nums[nowIndex] == nums[nowIndex + 1] {
//                nums.remove(at: nowIndex)
//                if nowIndex == nums.count - 1 {
//                    break
//                }
//            }
//            nowIndex += 1
//        }
//        return nums.count
//    }
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 用双指针，只遍历一次，当遇到不同值的时候，计数指针 index += 1，然后将工作指针 workerIndex 所指的值赋值到 index 所指的位置。
    //            直到 workerIndex 到达数组末尾为止。
    // 执行用时 : 112 ms, 在Remove Duplicates from Sorted Array的Swift提交中击败了86.13% 的用户
    // 内存消耗 : 19.3 MB, 在Remove Duplicates from Sorted Array的Swift提交中击败了50.29% 的用户
    private func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index = 0 // 指向不同值的第一个，永远是不同值种类 - 1
        guard nums.count > 0 else {
            return index
        }
        for workerIndex in 1..<nums.count {
            // 相同值放过，不同值处理。
            if nums[index] != nums[workerIndex] {
                index += 1
                nums[index] = nums[workerIndex]
            }
        }
        return index + 1
    }
    
    // Testcase: &[0,0,1,1,1,2,2,3,3,4] -> 5 | &[1, 1] -> 1
    func test() {
//        var a = [1, 1]
        var a = [0,0,1,1,1,2,2,3,3,4]
        print(removeDuplicates(&a))
    }
    
}
