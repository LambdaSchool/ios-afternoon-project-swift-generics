import UIKit
import Foundation

struct CountedSet: Hashable {
    
    private (set) var set: [String : Int] = [:]
    
    mutating func insert(entry: String, count: Int) {
        set[entry] = count
    }
    
    mutating func remove(entry: String) {
        set.removeValue(forKey: entry)
    }
    
    mutating func countEntries() -> Int {
        var count = 0
        
        guard !set.isEmpty else { return 0 }
        
        for _ in set {
            count += 1
        }
        
        return count
    }
    
}

var myCountedSet = CountedSet()

myCountedSet.insert(entry: "Hello", count: 3)
myCountedSet.insert(entry: "World", count: 9)

print(myCountedSet.set)
print(myCountedSet.countEntries())

myCountedSet.remove(entry: "World")

print(myCountedSet.set)
print(myCountedSet.countEntries())

myCountedSet.remove(entry: "Hello")

print(myCountedSet.countEntries())
