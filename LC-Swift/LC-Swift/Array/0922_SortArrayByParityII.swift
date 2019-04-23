//
//  0922_SortArrayByParityII.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/23.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个非负整数数组 A， A 中一半整数是奇数，一半整数是偶数。
 
 对数组进行排序，以便当 A[i] 为奇数时，i 也是奇数；当 A[i] 为偶数时， i 也是偶数。
 
 你可以返回任何满足上述条件的数组作为答案。
 
 
 示例：
 
 输入：[4,2,5,7]
 输出：[4,5,2,7]
 解释：[4,7,2,5]，[2,5,4,7]，[2,7,4,5] 也会被接受。
 
 
 提示：
 
 2 <= A.length <= 20000
 A.length % 2 == 0
 0 <= A[i] <= 1000
 */
class SortArrayByParityIISolution {
    
//    // Time Complexity: O(n) | Space Complexity: O(n)
//    // Thought: 分类 + 组合。
//    // 执行用时 : 340 ms, 在Sort Array By Parity II的Swift提交中击败了56.00% 的用户
//    // 内存消耗 : 20.1 MB, 在Sort Array By Parity II的Swift提交中击败了16.67% 的用户
//    // TODO: 减少耗时 + 减少内存消耗
//    private func sortArrayByParityII(_ A: [Int]) -> [Int] {
//        let arr1 = A.filter{ $0 % 2 == 0}
//        let arr2 = A.filter{ $0 % 2 != 0}
//        var result = [Int]()
//        for index in 0..<A.count/2 {
//            result.append(contentsOf: [arr1[index], arr2[index]])
//        }
//        return result
//    }
    
    // Time Complexity: O(n * k) | Space Complexity: O(1)
    // Thought: 规避了多次遍历数组并且筛选的耗时和创建临时数组的内存占用，用 index 指针指向偶数位，worker 指针指向奇数位。
    //          在遍历偶数位的时候若发现其值不为偶数，则遍历奇数位，找到第一个奇数位上为偶数的值，交换之，直到偶数位遍历到边界即可。
    // 执行用时 : 308 ms, 在Sort Array By Parity II的Swift提交中击败了84.00% 的用户
    // 内存消耗 : 19.4 MB, 在Sort Array By Parity II的Swift提交中击败了58.33% 的用户
    private func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var A = A
        var index = 0
        var worker = 1
        while index < A.count - 1 {
            if A[index] % 2 != 0 {
                while A[worker] % 2 != 0 {
                    worker += 2
                }
                A[index] = A[index] - A[worker]
                A[worker] = A[index] + A[worker]
                A[index] = A[worker] - A[index]
            }
            index += 2
        }
        return A
    }
    
    // Testcase: [4,2,5,7] -> [4, 5, 2, 7] | [2, 3] -> [2, 3]
    func test() {
        print(sortArrayByParityII([2, 3]))
    }
}
