import GL

public class GLBuffer {
    public var handle = GLMap.UInt()
    private var boundTarget: GLMap.Int = -1

    public init() {}

    public func setup() {
        glGenBuffers(1, &handle)
    }

    public func store<T>(_ data: [T]) {
        if boundTarget == -1 {
            fatalError("Must first bind buffer to a target before storing something in it.")
        }
        glBufferData(boundTarget, MemoryLayout<T>.size * data.count, data, GLMap.STATIC_DRAW)
    }

    public func bind(_ target: GLMap.Int) {
        glBindBuffer(target, handle)
        boundTarget = target
    }
}