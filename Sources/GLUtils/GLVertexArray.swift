import GL

public class GLVertexArray {
  public internal(set) var handle = GLMap.UInt()
  public var attributes: [ContiguousAttributes]

  public init(attributes: [ContiguousAttributes] = []) {
    self.attributes = attributes
  }

  public func setup() {
    glGenVertexArrays(1, &handle)
    glBindVertexArray(handle)
    for var attributes in attributes {
        attributes.setup()
    }
  }

  public func bind() {
    glBindVertexArray(handle)
  }

  public static func unbind() {
    glBindVertexArray(0)
  }
}

extension GLVertexArray {
  public class ContiguousAttributes {
    public var buffer: GLBuffer
    public var indexBuffer: GLBuffer?
    public var attributes: [GLVertexAttributeProtocol]

    public init(buffer: GLBuffer, indexBuffer: GLBuffer? = nil, attributes: [GLVertexAttributeProtocol]) {
      self.buffer = buffer
      self.indexBuffer = indexBuffer
      self.attributes = attributes
    }

    public func setup() {
      buffer.setup()
      buffer.bind(.arrayBuffer)

      if var indexBuffer = indexBuffer {
        indexBuffer.bind(.elementArrayBuffer)
      }

      let stride = attributes.reduce(into: 0) {
        $0 += $1.dataSize
      }

      var offset: Int = 0

      for attribute in attributes {
        attribute.setup(stride: stride, offset: offset)
        offset += attribute.dataSize
      }
    }
  }
}