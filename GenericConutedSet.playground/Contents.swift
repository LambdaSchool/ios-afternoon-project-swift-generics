import Foundation

struct CountedSet<Element: Hashable> {

    var member: Element
    var count: Int
    private var countedSet: Dictionary<Element, Int> = [:]

}
