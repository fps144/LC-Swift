//
//  0985_SumOfEvenNumbersAfterQueries.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/26.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给出一个整数数组 A 和一个查询数组 queries。
 
 对于第 i 次查询，有 val = queries[i][0], index = queries[i][1]，我们会把 val 加到 A[index] 上。然后，第 i 次查询的答案是 A 中偶数值的和。
 
 （此处给定的 index = queries[i][1] 是从 0 开始的索引，每次查询都会永久修改数组 A。）
 
 返回所有查询的答案。你的答案应当以数组 answer 给出，answer[i] 为第 i 次查询的答案。
 
 
 示例：
 
 输入：A = [1,2,3,4], queries = [[1,0],[-3,1],[-4,0],[2,3]]
 输出：[8,6,2,4]
 解释：
 开始时，数组为 [1,2,3,4]。
 将 1 加到 A[0] 上之后，数组为 [2,2,3,4]，偶数值之和为 2 + 2 + 4 = 8。
 将 -3 加到 A[1] 上之后，数组为 [2,-1,3,4]，偶数值之和为 2 + 4 = 6。
 将 -4 加到 A[0] 上之后，数组为 [-2,-1,3,4]，偶数值之和为 -2 + 4 = 2。
 将 2 加到 A[3] 上之后，数组为 [-2,-1,3,6]，偶数值之和为 -2 + 6 = 4。
 
 
 提示：
 
 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 1 <= queries.length <= 10000
 -10000 <= queries[i][0] <= 10000
 0 <= queries[i][1] < A.length
 */

class SumOfEvenNumbersAfterQueriesSolution {

//    // Time Out!!!
//    // Time Complexity: O(n²) | Space Complexity: O(n)
//    // Thought: 先按 queries 将 A 中的元素做变更，然后求偶数和。
//    // Reason: 遍历一次 queries 就会求 n 次和，耗时严重。
//    // Proposals：减少遍历求和次数
//    private func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
//        var _A = A
//        var result = [Int]()
//        for query in queries {
//            _A[query[1]] += query[0]
//            result.append(_A.reduce(0, { x, y in
//                return y % 2 == 0 ? x + y : x
//            }))
//        }
//        return result
//    }
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 为了避免每次更新 A 中的值后都要遍历一遍 A 去算偶数和，可以先把原始数组的偶数和算出来，然后根据查询数组更新 sourceSum
    // 执行用时 : 1208 ms, 在Sum of Even Numbers After Queries的Swift提交中击败了37.50% 的用户（？？？）
    // 内存消耗 : 20.7 MB, 在Sum of Even Numbers After Queries的Swift提交中击败了45.45% 的用户
    private func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var result = [Int](), _A = A
        var sourceSum = _A.reduce(0, { x, y in
            return y % 2 == 0 ? x + y : x
        })
        for query in queries {
            let val = query[0], index = query[1]
            if _A[index] % 2 == 0 {
                sourceSum -= _A[index]
            }
            _A[index] += val
            if _A[index] % 2 == 0 {
                sourceSum += _A[index]
            }
            result.append(sourceSum)
        }
        return result
    }
    
    func test() {
        print(sumEvenAfterQueries([1,2,3,4], [[1,0],[-3,1],[-4,0],[2,3]]))
    }
}
