# frozen_string_literal: true

module DoublyLinkedlist
  # Creates a node with value and links to next/previous nodes.
  class Node
    # @return [Object] the node value.
    attr_reader :value

    # @return [Node] the next/previous node object.
    attr_accessor :next, :prev

    # Initializes a node with the given object as its value.
    #
    # @param value [Object] the value to be set as node value.
    def initialize(value)
      @value = value
    end
  end
end
