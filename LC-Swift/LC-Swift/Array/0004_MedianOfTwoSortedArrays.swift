//
//  0004_MedianOfTwoSortedArrays.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
 
 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 
 你可以假设 nums1 和 nums2 不会同时为空。
 
 nums1 = [1, 3]
 nums2 = [2]
 
 则中位数是 2.0
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 则中位数是 (2 + 3)/2 = 2.5
 */

class medianOfTwoSortedArraysSolution {
    
    // Time Complexity: O(log(m + n)) | Space Complexity: O(n)
    // Thought: 看到 TC 为 O(log n) 这种，可以联想到二分查找。
    //          那么 O(log(m + n)) 可以理解为：将有 m 个 和 n 个元素的数组进行合并，然后二分法取中位数。
    private func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        /// Merge two arrays
        ///
        /// 合并两个有序数组
        ///
        /// - Parameter arr1: 数组1
        /// - Parameter arr2: 数组2
        /// - Returns: 合并过后的有序数组
        func mergeArrays(arr1: [Int], arr2: [Int]) -> [Int] {
            guard arr1.count != 0 && arr2.count != 0 else {
                var mergedArr = [Int]()
                if arr1.count == 0 {
                    mergedArr = arr2
                } else {
                    mergedArr = arr1
                }
                return mergedArr
            }

            return (arr1 + arr2).sorted(by: <)
        }
        
        /// Find array's median
        ///
        /// 找到数组的中位数
        ///
        /// - Parameter nums: 待找数组
        /// - Returns: 中位数
        func findMedian(nums: [Int]) -> Double {
            var median = 0.0
            if nums.count % 2 == 0 {
                median = Double(nums[nums.count / 2 - 1] + nums[nums.count / 2]) / 2.0
            } else {
                median = Double(nums[nums.count / 2])
            }
            
            return median
        }
        
        return findMedian(nums: mergeArrays(arr1: nums1, arr2: nums2))
    }
    
    //TODO: 1. 时间复杂度似乎不正确
    //TODO: 2. 耗时略长 执行用时 : 176 ms, 在Median of Two Sorted Arrays的Swift提交中击败了54.23% 的用户
    //TODO: 2. 内存占用略多 内存消耗 : 19.5 MB, 在Median of Two Sorted Arrays的Swift提交中击败了34.85% 的用户
    
    /// Testcase: [1, 2] [3, 4] -> 2.5
    func test() {
        print(findMedianSortedArrays([1, 2], [3, 4]))
    }
}
