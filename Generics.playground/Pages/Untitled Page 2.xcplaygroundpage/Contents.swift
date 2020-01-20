
import Foundation

var countedSet: [String : Int] = ["Bob" : 1, "Bill" : 1, "Chris" : 2]
countedSet["Bill"]

countedSet["Bob"]
countedSet["Bob"] = 2
countedSet["Bob"]
print(countedSet)
