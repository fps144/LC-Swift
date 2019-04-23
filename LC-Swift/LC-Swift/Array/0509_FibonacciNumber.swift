//
//  0509_FibonacciNumber.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/23.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 斐波那契数，通常用 F(n) 表示，形成的序列称为斐波那契数列。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：
 
 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 给定 N，计算 F(N)。
 
 示例：
 
 输入：2
 输出：1
 解释：F(2) = F(1) + F(0) = 1 + 0 = 1.
 
 提示：
 
 0 ≤ N ≤ 30
 */
class FibonacciNumberSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 求 Fibonacci 数列的第 N 个数的值，即求其前两个值 left 和 right 的值求和就行。
    // 执行用时 : 16 ms, 在Fibonacci Number的Swift提交中击败了72.88% 的用户
    // 内存消耗 : 18.3 MB, 在Fibonacci Number的Swift提交中击败了55.56% 的用户
    private func fib(_ N: Int) -> Int {
        guard N != 0 && N != 1 else {
            if N == 0 { return 0 }
            return 1
        }
        var leftVal = 0
        var rightVal = 1
        for _ in 1..<N-1 {
            rightVal = leftVal + rightVal
            leftVal = rightVal - leftVal
        }
        return leftVal + rightVal
    }
    
    // Testcase: 4 -> 3 | 8 -> 21
    func test() {
        print(fib(8))
    }
}
