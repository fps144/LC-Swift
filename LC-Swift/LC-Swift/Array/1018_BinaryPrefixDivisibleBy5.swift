//
//  1018_BinaryPrefixDivisibleBy5.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定由若干 0 和 1 组成的数组 A。我们定义 N_i：从 A[0] 到 A[i] 的第 i 个子数组被解释为一个二进制数（从最高有效位到最低有效位）。
 
 返回布尔值列表 answer，只有当 N_i 可以被 5 整除时，答案 answer[i] 为 true，否则为 false。
 
 示例 1：
 
 输入：[0,1,1]
 输出：[true,false,false]
 解释：
 输入数字为 0, 01, 011；也就是十进制中的 0, 1, 3 。只有第一个数可以被 5 整除，因此 answer[0] 为真。
 
 示例 2：
 
 输入：[1,1,1]
 输出：[false,false,false]
 
 示例 3：
 
 输入：[0,1,1,1,1,1]
 输出：[true,false,false,false,true,false]
 
 示例 4：
 
 输入：[1,1,1,0,1]
 输出：[false,false,false,false,false]
 
 提示：
 
 1 <= A.length <= 30000
 A[i] 为 0 或 1
 */

class BinaryPrefixDivisibleBy5Solution {
    
//    // Time out!!!
//    // Time Complexity: O(n logn) | Space Complexity: O(n)
//    // Thought: 二进制数十进制化后最后一位规律：除 0 以外，尾数以 2/4/6/8 为一个循环，而能否被 5 整除只需要看这个数的末尾是不是 0 或 5 即可。
//    // Proposals: 必然是内层循环耗时严重，既然是二进制运算，尝试运用位运算代替循环计算位数来解决问题。
//    private func prefixesDivBy5(_ A: [Int]) -> [Bool] {
//        var result = [Bool]()
//        var firstOneIndex = -1
//        let tailNumber = [0:6, 1:2, 2:4, 3:8]
//        for i in A.indices {
//            if firstOneIndex == -1 {
//                if A[i] == 0 {
//                    result.append(true)
//                } else {
//                    result.append(false)
//                    firstOneIndex = i
//                }
//            } else {
//                var total = A[i]
//                for j in firstOneIndex..<i {
//                    if A[j] == 1 {
//                        let bit = i - j
//                        total += tailNumber[bit % 4]!
//                    }
//                }
//                result.append(total % 5 == 0)
//            }
//        }
//        return result
//    }
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 从大佬那参考的方法。已知对于任意整数 a，有 a = (a / 5) * 5 + (a % 5)，则我们可以忽略前半部分，对于一个数能否被 5 整除，看后半部分 (a % 5) 就行。同时为了防止 Int 型的值溢出，每次取当前值只需取 current % 5 即可。
    // 执行用时 : 132 ms, 在Binary Prefix Divisible By 5的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 22.3 MB, 在Binary Prefix Divisible By 5的Swift提交中击败了9.09% 的用户
    private func prefixesDivBy5(_ A: [Int]) -> [Bool] {
        var current = 0
        var result = A.map{_ in false }
        for index in 0..<A.count {
            current = (current << 1) + A[index]
            result[index] = current % 5 == 0
            current = current % 5 // 防溢出
        }
        return result
    }
    
    // Testcase:[0,1,1] -> [true,false,false]
    //          [1,1,1] -> [false, false, false]
    //          [1,1,1,0,1] -> [false,false,false,false,false]
    //          [0,1,1,1,1,1] -> [true,false,false,false,true,false]
    func test() {
        print(prefixesDivBy5([0,1,1]))
        print(prefixesDivBy5([1,1,1]))
        print(prefixesDivBy5([1,1,1,0,1]))
        print(prefixesDivBy5([0,1,1,1,1,1]))
    }
}
