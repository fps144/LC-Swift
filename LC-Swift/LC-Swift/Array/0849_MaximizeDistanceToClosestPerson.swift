//
//  0849_MaximizeDistanceToClosestPerson.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 在一排座位（ seats）中，1 代表有人坐在座位上，0 代表座位上是空的。
 
 至少有一个空座位，且至少有一人坐在座位上。
 
 亚历克斯希望坐在一个能够使他与离他最近的人之间的距离达到最大化的座位上。
 
 返回他到离他最近的人的最大距离。
 
 示例 1：
 
 输入：[1,0,0,0,1,0,1]
 输出：2
 解释：
 如果亚历克斯坐在第二个空位（seats[2]）上，他到离他最近的人的距离为 2 。
 如果亚历克斯坐在其它任何一个空位上，他到离他最近的人的距离为 1 。
 因此，他到离他最近的人的最大距离是 2 。
 
 示例 2：
 
 输入：[1,0,0,0]
 输出：3
 解释：
 如果亚历克斯坐在最后一个座位上，他离最近的人有 3 个座位远。
 这是可能的最大距离，所以答案是 3 。
 
 提示：
 
 1 <= seats.length <= 20000
 seats 中只含有 0 和 1，至少有一个 0，且至少有一个 1。
 */

class MaximizeDistanceToClosestPersonSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 每遇到1个1，就记录 preOneIndex 为 index。
    //          1. 如果只有1个1，其位置为 index，那么最大距离即为 max(index, seats.count - 1 - index)
    //          所以当碰到第一个1的时候需要记录一个 result 为 index。
    //          2. 如果有多个1，那么最大距离为 max(result, ceil((index - preOneIndex - 1) / 2.0))
    //          3. 边界条件处理：遇到最后一个1，且当前 index != seats.count - 1 时仍需求一次最大值。
    // 执行用时 : 120 ms, 在Maximize Distance to Closest Person的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 20.7 MB, 在Maximize Distance to Closest Person的Swift提交中击败了14.29% 的用户
    private func maxDistToClosest(_ seats: [Int]) -> Int {
        var result = 0
        var preOneIndex = -1
        for index in 0..<seats.count {
            if seats[index] == 1 {
                result = preOneIndex == -1 ? index : max(result, Int(ceil(Double((index - preOneIndex - 1)) / 2.0)))
                preOneIndex = index
            } else {
                if index == seats.count - 1 {
                    result = max(result, index - preOneIndex)
                }
            }
        }
        return result
    }
    
    // Testcase: [1,0,0,0,1,0,1] -> 2
    func test() {
        print(maxDistToClosest([1,0,0,0,1,0,1]))
    }
}
