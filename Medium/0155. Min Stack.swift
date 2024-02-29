class MinStack {

    private var array: [Int]
    private var sorted = [Int]()

    init() {
        array = []
    }

    func push(_ val: Int) {
        array.append(val)
        if sorted.isEmpty {
            sorted.append(val)
        } else if sorted[0] <= val {
            sorted.insert(val, at: 0)
        }
    }

    func pop() {
        let value = array.removeLast()
        guard !sorted.isEmpty else {
            return
        }
        if value <= sorted[0] {
            sorted.removeFirst()
        }
    }

    func top() -> Int {
        array[array.count-1]
    }

    func getMin() -> Int {
        sorted[0]
    }
}