import GL

public class GLBuffer {
    public var handle = GLMap.UInt()
    private var boundTarget: BindingTarget? = nil

    public init() {}

    public func setup() {
        if handle == 0 {
            glGenBuffers(1, &handle)
        }
    }

    public func store<T>(_ data: [T]) {
        guard let boundTarget = boundTarget else {
            fatalError("Must first bind buffer to a target before storing something in it.")
        }
        glBufferData(boundTarget.glId, MemoryLayout<T>.size * data.count, data, GLMap.STATIC_DRAW)
    }

    public func bind(_ target: BindingTarget) {
        glBindBuffer(target.glId, handle)
        boundTarget = target
    }

    public enum BindingTarget {
      case arrayBuffer, atomicCounterBuffer, copyReadBuffer, copyWriteBuffer, dispatchIndirectBuffer, drawIndirectBuffer,
      elementArrayBuffer, pixelPackBuffer, pixelUnpackBuffer, queryBuffer, shaderStorageBuffer, textureBuffer,
      transformFeedbackBuffer, uniformBuffer
      
      public var glId: Int32 {
        switch self {
        case .arrayBuffer: return GLMap.ARRAY_BUFFER
        case .atomicCounterBuffer: return GLMap.ATOMIC_COUNTER_BUFFER
        case .copyReadBuffer: return GLMap.COPY_READ_BUFFER
        case .copyWriteBuffer: return GLMap.COPY_WRITE_BUFFER
        case .dispatchIndirectBuffer: return GLMap.DISPATCH_INDIRECT_BUFFER
        case .drawIndirectBuffer: return GLMap.DRAW_INDIRECT_BUFFER
        case .elementArrayBuffer: return GLMap.ELEMENT_ARRAY_BUFFER
        case .pixelPackBuffer: return GLMap.PIXEL_PACK_BUFFER
        case .pixelUnpackBuffer: return GLMap.PIXEL_UNPACK_BUFFER
        case .queryBuffer: return GLMap.QUERY_BUFFER
        case .shaderStorageBuffer: return GLMap.SHADER_STORAGE_BUFFER
        case .textureBuffer: return GLMap.TEXTURE_BUFFER
        case .transformFeedbackBuffer: return GLMap.TRANSFORM_FEEDBACK_BUFFER
        case .uniformBuffer: return GLMap.UNIFORM_BUFFER
        }
      }
    }
}