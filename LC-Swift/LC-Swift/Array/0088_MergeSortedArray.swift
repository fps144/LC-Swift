//
//  0088_MergeSortedArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 
 示例:
 
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 输出: [1,2,2,3,5,6]
 */

class MergeSortedArraySolution {
    
    // Time Complexity: O(n logn) | Space Complexity: O(n)
    // Thought: 截取 num1 的有效值，拼接上 num2，再排序。
    // 执行用时 : 32 ms, 在Merge Sorted Array的Swift提交中击败了66.17% 的用户
    // 内存消耗 : 21.1 MB, 在Merge Sorted Array的Swift提交中击败了6.03% 的用户
    private func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1 = (Array(nums1[0..<m]) + nums2).sorted()
    }
    
    // Testcase: ⤵️
    func test() {
        var nums1 = [1,2,3,0,0,0]
        let m = 3
        let nums2 = [2,5,6]
        let n = 3
        merge(&nums1, m, nums2, n)
        print(nums1)
    }
}
