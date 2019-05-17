//
//  1010_PairsOfSongsWithTotalDurationsDivisibleBy60.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 在歌曲列表中，第 i 首歌曲的持续时间为 time[i] 秒。
 
 返回其总持续时间（以秒为单位）可被 60 整除的歌曲对的数量。形式上，我们希望索引的数字  i < j 且有 (time[i] + time[j]) % 60 == 0。
 
 示例 1：
 
 输入：[30,20,150,100,40]
 输出：3
 解释：这三对的总持续时间可被 60 整数：
 (time[0] = 30, time[2] = 150): 总持续时间 180
 (time[1] = 20, time[3] = 100): 总持续时间 120
 (time[1] = 20, time[4] = 40): 总持续时间 60
 
 示例 2：
 
 输入：[60,60,60]
 输出：3
 解释：所有三对的总持续时间都是 120，可以被 60 整数。
 
 提示：
 
 1 <= time.length <= 60000
 1 <= time[i] <= 500
 */

class PairsOfSongsWithTotalDurationsDivisibleBy60Solution {
    
//    // Time Out!!!
//    // Time Complexity: O(n²) | Space Complexity: O(1)
//    // Thought: 需要注意的是，一个元素是可以多次使用的，所以两次循环遍历，找到 (time[i] + time[j]) % 60 == 0 所有情况的个数。
//    // Proposals: 减少遍历次数，尝试建立映射关系。
//    private func numPairsDivisibleBy60(_ time: [Int]) -> Int {
//        var result = 0
//        for i in 0..<time.count - 1 {
//            for j in i + 1..<time.count {
//                if (time[i] + time[j]) % 60 == 0 { result += 1 }
//            }
//        }
//        return result
//    }
    
//    // Time Complexity: O(n) | Space Complexity: O(n)
//    // Thought: 网上的方法，利用了题目本身 1 <= time[i] <= 500 的条件，但略慢，且不好理解。
//    //          遍历原数组，建立 HashMap，找出 1...500(两数之和即 2...1000) 中所有能被 60 整除解的集合 sum。
//    //          再次遍历原数组，从 HashMap 中减少 1 个对应的操作数，遍历 sum，找出满足条件的 t 的另一个加数 (sum - t) 的个数，加入结果中。
//    // 执行用时 : 1704 ms, 在Pairs of Songs With Total Durations Divisible by 60的Swift提交中击败了11.11% 的用户
//    // 内存消耗 : 22.1 MB, 在Pairs of Songs With Total Durations Divisible by 60的Swift提交中击败了16.67% 的用户
//    private func numPairsDivisibleBy60(_ time: [Int]) -> Int {
//        var result = 0
//        var timeMap = [Int: Int]()
//        for t in time {
//            timeMap[t, default: 0] += 1
//        }
//        let sums = (1...500).map{ $0 * 2}.filter{ $0 % 60 == 0 }
//        for t in time {
//            timeMap[t, default: 0] -= 1
//            for sum in sums {
//                result += timeMap[sum - t, default: 0]
//            }
//        }
//        return result
//    }
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 若 t % 60 = i，则说明 i 是和 t 匹配的，即 t in time, i 出现的个数之和即是答案。
    //          eg: 碰到一个 20，remainder = 20 % 60 = 20，那么就将索引为 20 的值 + 1，下次碰到 40 的时候，remainder = 40，取索引为 60 - remainder，的值加入结果计数即可。
    //          由此，可以建立以 t % 60 为索引 (下标) 的单一映射，记录这个余数出现的次数，最后只需把这些余数相加即可。
    // 执行用时 : 320 ms, 在Pairs of Songs With Total Durations Divisible by 60的Swift提交中击败了88.89% 的用户
    // 内存消耗 : 21.1 MB, 在Pairs of Songs With Total Durations Divisible by 60的Swift提交中击败了16.67% 的用户
    private func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var remainderOfTimeDevidedBy60 = Array.init(repeating: 0, count: 60) // 初始化一个长度为 60，值均为 0 的数组，记录 time % 60 的值。
        var result = 0
        for t in time {
            let remainder = t % 60
            result += remainder == 0 ? remainderOfTimeDevidedBy60[0] : remainderOfTimeDevidedBy60[60 - remainder] // 边界条件，当 time 为 60 时，余数为 0，所以应特殊处理。
            remainderOfTimeDevidedBy60[remainder] += 1 // 先加余数个数，再自增余数个数，是为了防止第一次碰到 60 的时候多加 1。
        }
        return result
    }
    
    // Testcase: [30,20,150,100,40] -> 3
    func test() {
        print(numPairsDivisibleBy60([30,20,150,100,40]))
    }
}
