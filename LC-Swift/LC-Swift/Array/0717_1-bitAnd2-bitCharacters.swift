//
//  0717_1-bitAnd2-bitCharacters.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 有两种特殊字符。第一种字符可以用一比特0来表示。第二种字符可以用两比特(10 或 11)来表示。
 
 现给一个由若干比特组成的字符串。问最后一个字符是否必定为一个一比特字符。给定的字符串总是由0结束。
 
 示例 1:
 
 输入:
 bits = [1, 0, 0]
 输出: True
 解释:
 唯一的编码方式是一个两比特字符和一个一比特字符。所以最后一个字符是一比特字符。
 
 示例 2:
 
 输入:
 bits = [1, 1, 1, 0]
 输出: False
 解释:
 唯一的编码方式是两比特字符和两比特字符。所以最后一个字符不是一比特字符。
 
 注意:
 
 1 <= len(bits) <= 1000.
 bits[i] 总是0 或 1.
 */

class OnebitAndTwobitCharactersSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 清理数组(到 index - 2)，将满足 2-bit 的数据删除，得到最终数组，根据条件判断是否为 1-bit 结尾。
    // 执行用时 : 44 ms, 在1-bit and 2-bit Characters的Swift提交中击败了60.47% 的用户
    // 内存消耗 : 20.6 MB, 在1-bit and 2-bit Characters的Swift提交中击败了5.88% 的用户
    private func isOneBitCharacter(_ bits: [Int]) -> Bool {
        guard bits.count > 1 else {
            return true
        }
        var bits = bits
        var index = 0
        let twoBit = [[1,0],[1,1]]
        while index < bits.count - 1 {
            if index == bits.count - 2 { break }
            if twoBit.contains([bits[index], bits[index + 1]]) {
                bits.removeSubrange(index..<index+2)
            } else {
                index += 1
            }
        }
        if bits.count == 0 {
            return false
        } else {
            if bits.count == 1 {
                return true
            } else {
                return !twoBit.contains([bits[bits.count - 2], bits.last!])
            }
        }
    }
    
    // Testcase: [1, 1, 1, 0] -> false
    func test() {
        print(isOneBitCharacter([1,1,1,0]))
    }
}
