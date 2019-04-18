//
//  0011_ContanierWithMostWater.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/19.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

class ContainerWithMostWaterSolution {
    
    // Time Out!!!
    // Time Complexity: O(n²) Space Complexity: O(1)
    // Thought: 求面积最大值其实就是求 △x 与对应 minY 的最大积。
    // Reason: 如果数据源过大，则遍历需要花很多时间，导致超时。
    // Proposals：减少遍历次数，试着建立映射关系。
    private func maxArea(_ height: [Int]) -> Int {
        var area = 0
        for n in 0..<height.count {
            for (index, value) in height.enumerated() {
                area = max(area, (index - n) * min(height[n], value))
            }
        }
        
        return area
    }
    
    // Container With Most Water
    //
    // Testcase: [1,8,6,2,5,4,8,3,7] -> 49
    func containerWithMostWaterTest() {
        print(maxArea([1,8,6,2,5,4,8,3,7]))
    }
}
