//
//  0532_K-diffPairsInAnArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数数组和一个整数 k, 你需要在数组里找到不同的 k-diff 数对。这里将 k-diff 数对定义为一个整数对 (i, j), 其中 i 和 j 都是数组中的数字，且两数之差的绝对值是 k.
 
 示例 1:
 
 输入: [3, 1, 4, 1, 5], k = 2
 输出: 2
 解释: 数组中有两个 2-diff 数对, (1, 3) 和 (3, 5)。
 尽管数组中有两个1，但我们只应返回不同的数对的数量。
 
 示例 2:
 
 输入:[1, 2, 3, 4, 5], k = 1
 输出: 4
 解释: 数组中有四个 1-diff 数对, (1, 2), (2, 3), (3, 4) 和 (4, 5)。
 
 示例 3:
 
 输入: [1, 3, 1, 5, 4], k = 0
 输出: 1
 解释: 数组中只有一个 0-diff 数对，(1, 1)。
 
 注意:
 
 数对 (i, j) 和数对 (j, i) 被算作同一数对。
 数组的长度不超过10,000。
 所有输入的整数的范围在 [-1e7, 1e7]。

 */

class KdiffPairsInAnArraySolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 分两种情况讨论：1. k == 0 时，配对的数即为当前的操作数；2. k > 0 时，配对的数即为 num - k 或 k - num 而且这两对数要么都存在，要么都不存在，因为题目说 (i, j) == (j, i)，所以这两对取其一即可。
    // 执行用时 : 212 ms, 在K-diff Pairs in an Array的Swift提交中击败了62.50% 的用户
    // 内存消耗 : 21 MB, 在K-diff Pairs in an Array的Swift提交中击败了14.29% 的用户
    private func findPairs(_ nums: [Int], _ k: Int) -> Int {
        guard k >= 0 else {
            return 0
        }
        var result = 0
        var numMap = [Int: Int]()
        for num in nums {
            numMap[num, default: 0] += 1
        }
        for (num, count) in numMap {
            if k == 0 {
                if count > 1 {
                    result += 1
                }
            } else {
                if let _ = numMap[num - k] {
                    result += 1
                }
            }
        }
        return result
    }
    
    // Testcase: [1, 3, 1, 5, 4], 0 -> 1
    func test() {
        print(findPairs([1, 2, 2, 2, 3], 1))
    }
}
