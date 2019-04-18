//
//  0011_ContanierWithMostWater.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/19.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

class ContainerWithMostWaterSolution {
    
//    // Time Out!!!
//    // Time Complexity: O(n²) Space Complexity: O(1)
//    // Thought: 求面积最大值其实就是求 △x 与对应 minY 的最大积。
//    // Reason: 如果数据源过大，则遍历需要花很多时间，导致超时。
//    // Proposals：减少遍历次数，试着建立映射关系。
//    private func maxArea(_ height: [Int]) -> Int {
//        var area = 0
//        for n in 0..<height.count {
//            for (index, value) in height.enumerated() {
//                area = max(area, (index - n) * min(height[n], value))
//            }
//        }
//
//        return area
//    }
    
    // Time Complexity: O(n) Space Complexity: O(1)
    // Thought:既然 MaxArea = max(△x * min(Y)，所以从数组两边逐渐向内收缩可以保证 △x 始终处于最大值，那么这个时候
    //           只需考虑 max(min(Y)) 即可。所以指针有二，起始位置分别位于数组头和数组尾，移动的时候，为保证面积最大，
    //           需要移动较小 Y 值对应的指针，以寻求增加 max(min(Y)) 的机会。 即只需将 left 指针向外移动或将 right 指针
    //           向内移动，每移动一次，计算一次 area 的值并取旧值和新值的最大值保存即可。
    private func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1, area = 0
        while (left < right) {
            area = max(area, (right - left) * min(height[left], height[right]))
            if (height[left] < height[right]) {
                left += 1
            } else {
                right -= 1
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
