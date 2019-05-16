//
//  0746_MinCostClimbingStairs.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 数组的每个索引做为一个阶梯，第 i 个阶梯对应着一个非负数的体力花费值 cost[i](索引从0开始)。
 
 每当你爬上一个阶梯你都要花费对应的体力花费值，然后你可以选择继续爬一个阶梯或者爬两个阶梯。
 
 您需要找到达到楼层顶部的最低花费。在开始时，你可以选择从索引为 0 或 1 的元素作为初始阶梯。
 
 示例 1:
 
 输入: cost = [10, 15, 20]
 输出: 15
 解释: 最低花费是从cost[1]开始，然后走两步即可到阶梯顶，一共花费15。
 
 示例 2:
 
 输入: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
 输出: 6
 解释: 最低花费方式是从cost[0]开始，逐个经过那些1，跳过cost[3]，一共花费6。
 
 注意：
 
 cost 的长度将会在 [2, 1000]。
 每一个 cost[i] 将会是一个Integer类型，范围为 [0, 999]。
 */

class MinCostClimbingStairsSolution {
    
    // Time Compplexity: O(n) | Space Complexity: O(n)
    // Thought: 先处理 台阶数 <= 2 的特殊情况。最后一步的条件一定是取倒数第一或第二台阶的最小值。
    //          那么为了求走到倒数第一或第二台阶的最小值，就需要它们两个每个都是最小值，以倒数第一举例即 minLast = cost[lastIndex] + min(oneToLastTotalCost, twoToLastTotalCost)。
    //          以此类推，从 index = 2 开始，到数组末尾，记录从当前台阶出发的最小值即可。
    // 执行用时 : 56 ms, 在Min Cost Climbing Stairs的Swift提交中击败了83.33% 的用户
    // 内存消耗 : 20.4 MB, 在Min Cost Climbing Stairs的Swift提交中击败了16.67% 的用户
    private func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard cost.count > 2 else {
            return cost.count == 2 ? min(cost[0], cost[1]) : 0
        }
        var cost = cost
        for index in 2..<cost.count {
            cost[index] += min(cost[index - 1], cost[index - 2])
        }
        
        return min(cost[cost.count - 1], cost[cost.count - 2])
    }
    
    // Testcase: [1, 100, 1, 1, 1, 100, 1, 1, 100, 1] -> 6
    func test() {
        print(minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]))
    }
}
