# frozen_string_literal: true

require 'doubly_linkedlist/node'

module DoublyLinkedlist
  # Creates list with nodes
  class List
    include Enumerable

    # @return [Integer] the number of nodes in the list.
    attr_reader :count

    # Initializes the object with nodes having the values passed in
    # the optional argument array.
    #
    # @param values [Array] the values of nodes
    def initialize(values = [])
      @count = 0
      build_list_from_array(values)
    end

    # Returns the value at the head of the list if present, nil otherwise.
    #
    # @return [Object, Nil] the node value object or nil.
    def head
      @head.value if @head
    end

    alias :first :head

    # Returns the value at the tail of the list if present, nil otherwise.
    #
    # @return [Object, Nil] the node value object or nil.
    def tail
      @tail.value if @tail
    end

    alias :last :tail

    # Returns the node object at the given index if present, nil otherwise.
    #
    # @param index [Integer] the index where to look up.
    # @return [Object, Nil] the value at the given index, or nil if index is out of range.
    def find_at(index)
      return if (index + 1) > count || index < 0

      item = @head
      index.times { item = item.next }
      item.value
    end

    # Returns the leftmost index of the value present in the list.
    # Returns nil if the value is not present.
    #
    # @param value [Object] the node value for which to be looked up.
    # @return [Integer, Nil] the index of the value passed in, or nil if value is not present.
    def index(value)
      find_index(value, 0, @head, :next, 1)
    end

    # Returns the rightmost index of value present in the list.
    # Returns nil if the value is not present.
    #
    # @param value [Object] the node value for which to be looked up.
    # @return [Integer, Nil] the index of the value passed in, or nil if value is not present.
    def rindex(value)
      find_index(value, count - 1, @tail, :prev, -1)
    end

    # Inserts a node with the given value into the head of the list,
    # increments and returns the count of nodes.
    #
    # @param value [Object] the node value to be inserted into the list.
    # @return [Integer] the number of nodes after insertion.
    def insert(value)
      new_node = Node.new(value)
      @head.prev = new_node if @head
      new_node.next = @head
      @tail = new_node unless @tail
      @head = new_node
      @count += 1
    end

    alias :push :insert

    # Inserts a node with the given value into the tail of the list,
    # increments and returns the count of nodes.
    #
    # @param value [Object] the node value to be enqueued into the list.
    # @return [Integer] the number of nodes after insertion.
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
    #
    # @param index [Integer] the index at which node has to be deleted.
    # @return [Object] the deleted node value.
    def delete_at(index)
      return if (index + 1) > count || index < 0

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

    # Pops out and returns the node_value at the list head.
    #
    # @return [Object] the popped out node value.
    def pop
      delete_at(0)
    end

    alias :deque :pop

    # Converts the list representation into a string.
    #
    # @return [String] the string object after converting the representation of list into string.
    def to_s
      str = "<#{self.class}: ["

      each_with_index do |v, i|
        str += v.to_s
        str += ', ' unless i == (count - 1)
      end

      str + ']>'
    end

    alias :inspect :to_s

    # Support for Enumerable methods.
    #
    # @params [Block] the block to be yielded on each item
    # @return [Enumerator] the enumerator when no block is given
    # @return [DoublyLinkedlist] the object after yielding block on every item
    def each
      return enum_for(:each) unless block_given?

      item = @head

      while item do
        yield item.value
        item = item.next
      end
    end

    private

    # Enqueue nodes one by one with the values given as an array into the list.
    def build_list_from_array(values)
      values.each { |v| enqueue(v) }
    end

    def find_index(value, start_index, start_item, item_iterator_name, step)
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
