//
//  0066_PlusOne.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 
 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
 
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 
 示例 1:
 
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 
 示例 2:
 
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 */

class PlusOneSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 记录进位状态，且若首尾亦需要进位，则特殊处理即可。
    // 执行用时 : 12 ms, 在Plus One的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 20.7 MB, 在Plus One的Swift提交中击败了5.26% 的用户
    private func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1
        var needCarry = true
        while index >= 0 {
            if !needCarry { break }
            if digits[index] + 1 == 10 {
                needCarry = true
                digits[index] = 0
                if index == 0 {
                    digits.insert(1, at: 0)
                    break
                }
            } else {
                needCarry = false
                digits[index] += 1
            }
            index -= 1
        }
        return digits
    }
    
    // Testcase: [1,9,9] -> [2,0,0]
    func test() {
        print(plusOne([1,9,9]))
    }
}
