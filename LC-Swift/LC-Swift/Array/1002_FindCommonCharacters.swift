//
//  1002_FindCommonCharacters.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/26.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定仅有小写字母组成的字符串数组 A，返回列表中的每个字符串中都显示的全部字符（包括重复字符）组成的列表。例如，如果一个字符在所有字符串中出现 3 次，但不是 4 次，则需要在最终答案中包含该字符 3 次。
 
 你可以按任意顺序返回答案。
 
 
 示例 1：
 
 输入：["bella","label","roller"]
 输出：["e","l","l"]
 示例 2：
 
 输入：["cool","lock","cook"]
 输出：["c","o"]
 
 
 提示：
 
 1 <= A.length <= 100
 1 <= A[i].length <= 100
 A[i][j] 是小写字母
 */

class FindCommonCharactersSolution {
    
    // Time Complexity: O(n * m) | Space Complexity: O(n)
    // Thought: 起初以A[0]为标本。遍历所有字符串，将当前字符串和标本字符串共有的字符串记录下来，当做下一次循环的标本，直到循环完毕，此时的标本，就是共有的串。
    //          而为了记录多次出现的字符，则只需要在遍历当前串的时候，将重复出现且在标本串中的字符依次加在标本串之后。
    // 执行用时 : 124 ms, 在Find Common Characters的Swift提交中击败了92.86% 的用户
    // 内存消耗 : 19.6 MB, 在Find Common Characters的Swift提交中击败了61.54% 的用户
    private func commonChars(_ A: [String]) -> [String] {
        var result = A[0]
        for str in A {
            var currentStr = str
            var newResult = ""
            for char in result {
                if let index = currentStr.firstIndex(of: char) {
                    newResult.append(char)
                    currentStr.remove(at: index)
                }
            }
            result = newResult
        }
        return result.map { String($0) }
    }
    
    // Testcase: ["bella","label","roller"] -> ["e", "l", "l"]
    func test() {
        print(commonChars(["bella","label","roller"]))
    }
}
