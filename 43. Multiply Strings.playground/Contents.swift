import Foundation

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        let zero = Unicode.Scalar("0")!.value
        
        let num1 = Array(num1).map { $0.unicodeScalars.first!.value - zero }
        let num2 = Array(num2).map { $0.unicodeScalars.first!.value - zero }
        
        let count1 = num1.count
        let count2 = num2.count
        
        var result = Array<UInt32>.init(repeating: 0, count: count1 + count2)
        
        for i in (0..<count1).reversed() {
            for j in (0..<count2).reversed() {
                let mul = num1[i] * num2[j]
                let pos1 = i + j
                let pos2 = i + j + 1
                
                let sum = mul + result[pos2]
                result[pos2] = sum % 10
                result[pos1] += sum / 10
            }
        }
        
        var answer = ""
        for val in result {
            if !(answer.isEmpty && val == 0) {
                answer.append("\(val)")
            }
        }
        
        return !answer.isEmpty ? answer : "0"
    }
}

let solution = Solution()
print(solution.multiply("14", "14"))
