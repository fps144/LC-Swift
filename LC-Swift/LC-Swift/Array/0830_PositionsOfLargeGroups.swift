//
//  0830_PositionsOfLargeGroups.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 在一个由小写字母构成的字符串 S 中，包含由一些连续的相同字符所构成的分组。
 
 例如，在字符串 S = "abbxxxxzyy" 中，就含有 "a", "bb", "xxxx", "z" 和 "yy" 这样的一些分组。
 
 我们称所有包含大于或等于三个连续字符的分组为较大分组。找到每一个较大分组的起始和终止位置。
 
 最终结果按照字典顺序输出。
 
 示例 1:
 
 输入: "abbxxxxzzy"
 输出: [[3,6]]
 解释: "xxxx" 是一个起始于 3 且终止于 6 的较大分组。
 
 示例 2:
 
 输入: "abc"
 输出: []
 解释: "a","b" 和 "c" 均不是符合要求的较大分组。
 
 示例 3:
 
 输入: "abcdddeeeeaabbbcd"
 输出: [[3,5],[6,9],[12,14]]
 说明:  1 <= S.length <= 1000
 */

class PositionsOfLargeGroupsSolution {
    
    // Time Complexity: O(n) | Space Complexity O(n)
    // Thought: 双指针，首个字符的坐标记为 i，遍历数组，如果当前指针指向数组末尾或 arr[index] != arr[index + 1]，则判断两者距离是否 >= 3。
    // 执行用时 : 28 ms, 在Positions of Large Groups的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 21.1 MB, 在Positions of Large Groups的Swift提交中击败了11.11% 的用户
    private func largeGroupPositions(_ S: String) -> [[Int]] {
        var result = [[Int]]()
        var i = 0
        //        var i = S.startIndex
        //        for index in S.indices {
        //            if index == S.index(S.startIndex, offsetBy: S.count - 1) || S[index] != S[S.index(index, offsetBy: 1)] {
        //                if S.distance(from: i, to: index) + 1 >= 3 {
        //                    result.append([S.distance(from: S.startIndex, to: i), S.distance(from: S.startIndex, to: index)])
        //                }
        //                i = S.index(index, offsetBy: 1)
        //            }
        //        }
        let arr = Array(S)
        for index in arr.indices {
            if index == arr.count - 1 || arr[index] != arr[index + 1] {
                if (index - i + 1 >= 3) {
                    result.append([i, index])
                }
                i = index + 1
            }
        }
        return result
    }
    
    // Testcase: "abcdddeeeeaabbbcd" -> [[3,5],[6,9],[12,14]]
    func test() {
        print(largeGroupPositions("abcdddeeeeaabbbcd"))
    }
}
