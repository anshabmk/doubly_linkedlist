# frozen_string_literal: true

module DoublyLinkedlist
  class Node
    attr_reader :value
    attr_accessor :next, :prev

    def initialize(value)
      @value = value
    end
  end
end
