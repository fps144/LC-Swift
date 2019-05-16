//
//  0989_AddToArray-FormOfInteger.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 对于非负整数 X 而言，X 的数组形式是每位数字按从左到右的顺序形成的数组。例如，如果 X = 1231，那么其数组形式为 [1,2,3,1]。
 
 给定非负整数 X 的数组形式 A，返回整数 X+K 的数组形式。
 
 示例 1：
 
 输入：A = [1,2,0,0], K = 34
 输出：[1,2,3,4]
 解释：1200 + 34 = 1234
 
 示例 2：
 
 输入：A = [2,7,4], K = 181
 输出：[4,5,5]
 解释：274 + 181 = 455
 
 示例 3：
 
 输入：A = [2,1,5], K = 806
 输出：[1,0,2,1]
 解释：215 + 806 = 1021
 
 示例 4：
 
 输入：A = [9,9,9,9,9,9,9,9,9,9], K = 1
 输出：[1,0,0,0,0,0,0,0,0,0,0]
 解释：9999999999 + 1 = 10000000000
 
 提示：
 
 1 <= A.length <= 10000
 0 <= A[i] <= 9
 0 <= K <= 10000
 如果 A.length > 1，那么 A[0] != 0
 */

class AddToArrayFormOfIntegerSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 采用两数组对位相加的形式。先求出 array 类型的 K，然后再将两个数组相加，只需记录当前这一位加完(也许包括进位的1)之后是否仍需进位，以及算出当前这一位的值。
    //          边界条件进位在首位插入 1 即可。
    // 执行用时 : 364 ms, 在Add to Array-Form of Integer的Swift提交中击败了94.44% 的用户
    // 内存消耗 : 21.4 MB, 在Add to Array-Form of Integer的Swift提交中击败了14.29% 的用户
    private func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        guard K != 0 else {
            return A
        }
        // 求 array 类型的 K
        var K = K
        var arrayFormK = [Int]()
        while K != 0 {
            arrayFormK.insert(K % 10, at: 0)
            K = K / 10
        }
        
        return A.count >= arrayFormK.count ? addArray(A, arrayFormK) : addArray(arrayFormK, A)
    }
    
    private func addArray(_ largeArr: [Int], _ smallArr: [Int]) -> [Int] {
        var needCarry = false
        var index = largeArr.count - 1
        var largeArr = largeArr
        var tailIndex = smallArr.count - 1
        while index >= 0 {
            if needCarry {
                largeArr[index] += 1
            }
            if tailIndex >= 0 {
                largeArr[index] += smallArr[tailIndex]
            }
            if largeArr[index] >= 10 {
                needCarry = true
                largeArr[index] = largeArr[index] % 10
                if index == 0 {
                    largeArr.insert(1, at: 0)
                    break
                }
            } else {
                needCarry = false
            }
            tailIndex -= 1
            index -= 1
        }
        return largeArr
    }
    
    // Testcase: [9,9,9,9,9,9,9,9,9,9], 1 -> [1,0,0,0,0,0,0,0,0,0,0] | [2,1,5], 806 -> [1,0,2,1]
    func test() {
        print(addToArrayForm([2,1,5], 806))
    }
}
