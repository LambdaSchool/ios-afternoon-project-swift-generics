import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var dictionary = [Element: Int] = [:]
}
