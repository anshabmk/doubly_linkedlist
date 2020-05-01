# frozen_string_literal: true

require 'doubly_linkedlist/node'

module DoublyLinkedlist
  class List
    attr_reader :count

    def initialize(values = [])
      @count = 0
      build_list_from_array(values)
    end

    def head
      @head.value if @head
    end

    alias :first :head

    def tail
      @tail.value if @tail
    end

    alias :last :tail

    # Returns the node object at the given index if present, nil otherwise.
    # Signature: Integer -> Node
    def find_at(index)
      return if (index + 1) > count

      item = @head
      index.times { item = item.next }
      item.value
    end

    # Returns the leftmost index of the value present in the list.
    # Returns nil if the value is not present.
    # Signature: Type(node_value) -> Integer
    def index(value)
      find_index(0, @head, :next, 1)
    end

    # Returns the rightmost index of value present in the list.
    # Returns nil if the value is not present.
    # Signature: Type(node_value) -> Integer
    def rindex(value)
      find_index(count - 1, @tail, :prev, -1)
    end

    # Inserts a node with the given value into the head of the list,
    # increments and returns the count of nodes.
    def insert(value)
      new_node = Node.new(value)
      @head.prev = new_node if @head
      new_node.next = @head
      @tail = new_node unless @tail
      @head = new_node
      @count += 1
    end

    alias :push :insert

    def enqueue(value)
      new_node = Node.new(value)
      @head = new_node unless @head
      @tail.next = new_node if @tail
      new_node.prev = @tail
      @tail = new_node
      @count += 1
    end

    # Deletes the node at a given index and returns the value present in the
    # deleted node.
    # Returns nil if the given index is out of range.
    # Signature: int -> Type(deleted_node.value)
    def delete_at(index)
      return if (index + 1) > count

      if index.zero?
        deleted = @head
        @head = @head.next
      else
        prev_item = @head

        (index - 1).times { prev_item = prev_item.next }

        deleted = prev_item.next
        prev_item.next = deleted.next
        @tail = prev_item if prev_item.next.nil?
      end

      @count -= 1
      deleted.value
    end

    # Pops out and returns the node_value at head.
    def pop
      delete_at(0)
    end

    alias :deque :pop

    def to_a
      item = @head
      arr = []

      while item do
        arr.push(item.value)
        item = item.next
      end

      arr
    end

    def to_s
      to_a.to_s
    end

    alias :inspect :to_s

    private

    # Enqueue nodes one by one with the values given as an array into the list.
    def build_list_from_array(values)
      values.each { |v| enqueue(v) }
    end

    def find_index(start_index, start_item, item_iterator_name, step)
      i = start_index
      item = start_item

      while item do
        return i if item.value == value

        item = item.send(item_iterator_name)
        i += step
      end
    end
  end
end
