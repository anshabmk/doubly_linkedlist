# frozen_string_literal: true

require 'doubly_linkedlist/node'

module DoublyLinkedlist
  class List
    attr_reader :count, :head

    def initialize(values = [])
      @count = 0
      build_list_from_array(values)
    end

    # Returns the node object at the given index if present, nil otherwise.
    # Signature: Integer -> Node
    def find_at(index)
      return if (index + 1) > count

      item = head
      index.times { item = item.next }
      item
    end

    # Returns the node object with the given value if present, nil otherwise.
    # Signature: Type(node_obj.value) -> Node
    def find_by_value(value)
      item = @head

      while item != nil do
        return item if item.value == value

        item = item.next
      end
    end

    # Inserts a node with the given value into the head of the list and
    # increments the counter.
    def insert(value)
      new_node = Node.new(value)
      new_node.next = head
      @head = new_node
      @count += 1
    end

    # Deletes the node at a given index and returns the value present in the
    # deleted node.
    # Returns nil if the given index is out of range.
    # Signature: int -> Type(deleted_node.value)
    def delete_at(index)
      return if (index + 1) > count

      if index.zero?
        deleted = head
        @head = @head.next
      else
        prev_item = head

        (index - 1).times { prev_item = prev_item.next }

        deleted = prev_item.next
        prev_item.next = deleted.next
      end

      @count -= 1
      deleted.value
    end

    # Prints out the values in the list one by one starting from head.
    def dump_list
      item = head

      while item do
        p item.value
        item = item.next
      end
    end

    private

    # Inserts nodes one by one with the values given as an array into the list.
    def build_list_from_array(values)
      (values.size - 1).downto(0) { |i| insert(values[i]) }
    end
  end
end
