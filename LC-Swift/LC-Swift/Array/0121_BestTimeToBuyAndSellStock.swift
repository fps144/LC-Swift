//
//  0121_BestTimeToBuyAndSellStock.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/8.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
 
 如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
 
 注意你不能在买入股票前卖出股票。
 
 示例 1:
 
 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
 注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 
 示例 2:
 
 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
 */

class BestTimeToBuyAndSellStockSolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(1)
    // Thought: 动态规划问题，求最终最优解，其实是求子集最优解，即求最小买入价格的前提下，取每次交易的最大收益值。
    // 执行用时 : 56 ms, 在Best Time to Buy and Sell Stock的Swift提交中击败了99.14% 的用户
    // 内存消耗 : 19 MB, 在Best Time to Buy and Sell Stock的Swift提交中击败了41.30% 的用户
    private func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var profit = 0
        var buy = -prices[0]
        for price in prices {
            buy = max(buy, -price)
            profit = max(profit, price + buy)
        }
        return profit
    }
    
    // Testcase: [7,1,5,3,6,4] -> 5 | [7,6,4,3,1] -> 0
    func test() {
        print(maxProfit([7,1,5,3,6,4]))
    }
}
