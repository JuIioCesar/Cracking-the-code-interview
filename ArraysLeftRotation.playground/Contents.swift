//Arrays: Left Rotation

//A left rotation operation on an array of size  shifts each of the array's elements  unit to the left. For example, if left rotations are performed on array , then the array would become .
//
//Given an array of  integers and a number, , perform  left rotations on the array. Then print the updated array as a single line of space-separated integers.

//n d
//1 2 3 4 5

import Foundation

extension Array {
    func getElementWith(modulo i: Int) -> Element {
        var index = i % self.count
        if index < 0 {
            index = index + self.count
        }
        return self[index]
    }
}

func rotate(array: [Int], displacement : Int) -> [Int] {
    var output = [Int]()
    if array.count == 0 { return output }
    for index in  0...array.count - 1 {
        let element = array.getElementWith(modulo: index-(array.count-displacement))
        output.append(element)
    }
    return output
}

assert(rotate(array: [1,2,3,4,5], displacement: 0) == [1,2,3,4,5])
assert(rotate(array: [1,2,3,4,5], displacement: 1) == [2,3,4,5,1])
assert(rotate(array: [1,2,3,4,5], displacement: -1) == [5,1,2,3,4])
assert(rotate(array: [1,2,3,4,5], displacement: 5) == [1,2,3,4,5])
assert(rotate(array: [],displacement: 0) == [])

func main() {
    let line1 = readLine() ?? "5 4"
    let line2 = readLine() ?? "1 2 3 4 5"
    
    let firstLineElements = line1.components(separatedBy: " ")
    let n = Int(firstLineElements[0]) ?? 0
    let displacement = Int((firstLineElements[1])) ?? 0
    let secondLineElements = line2.components(separatedBy: " ")
    var array = Array<Int>()
    
    if n < 1 {
        print("")
        exit(0)
    }
    
    for index in 0...n-1 {
        let element = Int(secondLineElements[index]) ?? 0
        array.append(element)
    }
    
    let outputIntegerArray = rotate(array: array, displacement: displacement)
    let outputStringArray = outputIntegerArray.flatMap({ String($0) })
    let output = outputStringArray.joined(separator: " ")
    print(output)
}

main()

// Learning: Modules in negative values are the same as in positive but in negative.
// Learning: Map, FlatMap filter, zip are important. Don´t dismiss them.
// Question: How to do the same with subscripts?
// Question: How can this be done with byte operations?
// Question: How would you do this with collections?
