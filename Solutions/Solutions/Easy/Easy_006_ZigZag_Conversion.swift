/*

https://oj.leetcode.com/problems/zigzag-conversion/

#6 ZigZag Conversion

Level: easy

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R

And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);

convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

Inspired by @dylan_yu at https://leetcode.com/discuss/10493/easy-to-understand-java-solution

*/

// Helper
private extension String {
    subscript (index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

class Easy_006_ZigZag_Conversion {
    // O (N)
    class func convert(s  s: String, nRows: Int) -> String {
        var arr = Array<String>(count: nRows, repeatedValue: String())
        var i = 0, len = s.characters.count
        while i < len {
            var index = 0
            while index < nRows && i < len {
                arr[index].append(s[i])
                i += 1
                index += 1
            }
            index = nRows - 2
            while index > 0 && i < len {
                arr[index].append(s[i])
                i += 1
                index -= 1
            }
        }
        var res = String()
        for i in 0..<nRows {
            res += (arr[i])
        }
        return res
    }
}
