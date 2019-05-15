//
//  0414_ThirdMaximumNumber.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个非空数组，返回此数组中第三大的数。如果不存在，则返回数组中最大的数。要求算法时间复杂度必须是O(n)。
 
 示例 1:
 
 输入: [3, 2, 1]
 
 输出: 1
 
 解释: 第三大的数是 1.
 
 示例 2:
 
 输入: [1, 2]
 
 输出: 2
 
 解释: 第三大的数不存在, 所以返回最大的数 2 .
 
 示例 3:
 
 输入: [2, 2, 3, 1]
 
 输出: 1
 
 解释: 注意，要求返回第三大的数，是指第三大且唯一出现的数。
 存在两个值为2的数，它们都排第二。
 */

class ThirdMaximumNumberSolution {
    
//    // Time Complexity: O(n logn) | Space Complexity: O(n)
//    // Thought: 先用 Set 求出数组内有多少不同的值，对特殊情况(Set.count < 2)做处理，再常规取第三大的值。
//    // 执行用时 : 104 ms, 在Third Maximum Number的Swift提交中击败了23.53% 的用户
//    // 内存消耗 : 22 MB, 在Third Maximum Number的Swift提交中击败了9.09% 的用户
//    // TODO: 时间复杂度不符合要求。
//    private func thirdMax(_ nums: [Int]) -> Int {
//        let setNum = Set(nums).sorted()
//        guard setNum.count > 2 else {
//            return setNum.max()!
//        }
//        var maxTuple = (Int.min, Int.min, Int.min)
//        for num in setNum {
//            if num > maxTuple.0 {
//                maxTuple = (num, maxTuple.0, maxTuple.1)
//            } else if num > maxTuple.1 {
//                maxTuple = (maxTuple.0, num, maxTuple.1)
//            } else {
//                maxTuple.2 = num
//            }
//        }
//        return maxTuple.2
//    }
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 依然使用 Set 来去重，不过这次是将结果去重，而非像上面的解法将数据源去重。每次循环，通过判断 Set 元素个数及 remove 掉最小值来保持 Set 中可能有 3 个最大值。
    // 执行用时 : 64 ms, 在Third Maximum Number的Swift提交中击败了76.47% 的用户
    // 内存消耗 : 22.2 MB, 在Third Maximum Number的Swift提交中击败了9.09% 的用户
    private func thirdMax(_ nums: [Int]) -> Int {
        var topThree = Set<Int>()
        for num in nums {
            topThree.insert(num)
            if topThree.count > 3 {
                topThree.remove(topThree.min()!)
            }
        }
        return topThree.count == 3 ? topThree.min()! : topThree.max()!
    }
    
    // Testcase: [2, 2, 3, 1] -> 1 | [1, 2] -> 2
    func test() {
        print(thirdMax([5,2,4,1,3,6,0]))
    }
}
