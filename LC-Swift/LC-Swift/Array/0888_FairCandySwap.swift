//
//  0888_FairCandySwap.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/9.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 爱丽丝和鲍勃有不同大小的糖果棒：A[i] 是爱丽丝拥有的第 i 块糖的大小，B[j] 是鲍勃拥有的第 j 块糖的大小。
 
 因为他们是朋友，所以他们想交换一个糖果棒，这样交换后，他们都有相同的糖果总量。（一个人拥有的糖果总量是他们拥有的糖果棒大小的总和。）
 
 返回一个整数数组 ans，其中 ans[0] 是爱丽丝必须交换的糖果棒的大小，ans[1] 是 Bob 必须交换的糖果棒的大小。
 
 如果有多个答案，你可以返回其中任何一个。保证答案存在。
 
 示例 1：
 
 输入：A = [1,1], B = [2,2]
 输出：[1,2]
 
 示例 2：
 
 输入：A = [1,2], B = [2,3]
 输出：[1,2]
 
 示例 3：
 
 输入：A = [2], B = [1,3]
 输出：[2,3]
 
 示例 4：
 
 输入：A = [1,2,5], B = [2,4]
 输出：[5,4]
 
 提示：
 
 1 <= A.length <= 10000
 1 <= B.length <= 10000
 1 <= A[i] <= 100000
 1 <= B[i] <= 100000
 保证爱丽丝与鲍勃的糖果总量不同。
 答案肯定存在。
 */

class FairCandySwapSolution {
    
//    // Time Out!!!
//    // Time Complexity: O(n²) | Space Complexity: O(1)
//    // Thought: 求两边的和之差，确定需要转移糖果量的差值(和之差 * 0.5)，然后循环遍历两个数组，找满足条件的糖果并返回。
//    // Reason: 遍历数据源耗时严重。
//    // Proposals：减少数据源遍历次数。
//    private func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
//        var result = [Int]()
//        let difference = A.reduce(0, +) - B.reduce(0, +)
//        for aIndex in A.indices {
//            if result.count > 0 { break }
//            for bIndex in B.indices {
//                if A[aIndex] - B[bIndex] == difference / 2 {
//                    result = [A[aIndex], B[bIndex]]
//                    break
//                }
//            }
//        }
//        return result
//    }
    
    // TimeComplexity: O(n) | SpaceComplexity: O(n)
    // Thought: 用集合来代替循环遍历，加快判定速度。
    // 执行用时 : 1168 ms, 在Fair Candy Swap的Swift提交中击败了20.00% 的用户
    // 内存消耗 : 19.5 MB, 在Fair Candy Swap的Swift提交中击败了100.00% 的用户
    private func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        var result = [Int]()
        let difference = (A.reduce(0, +) - B.reduce(0, +)) / 2
        let setB = Set.init(B)
        for num in A {
            if setB.contains(num - difference) {
                result = [num, num - difference]
                break
            }
        }
        return result
    }
    
    // Testcase: [1,2,5], [2,4] -> [5,4]
    func test() {
        print(fairCandySwap([1,2,5], [2,4]))
    }
}
