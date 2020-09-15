class Node
  attr_accessor :next, :data

  def initialize(&block)
    yield(self) if block
  end

  def inspect
    data
  end
end

class Linked
  include Enumerable

  attr_accessor :head, :tail

  def push_front(key)
    node = Node.new { |n| n.data = key }

    node.next = head
    self.head = node
    self.tail = head if tail.nil?
  end

  def each(&block)
    return to_enum(:each) unless block

    next_node = head
    while next_node
      block.call(next_node)
      next_node = next_node.next
    end
  end
end

list = Linked.new
list.push_front 10
list.push_front 11
p list.each
