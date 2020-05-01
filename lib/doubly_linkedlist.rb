require "doubly_linkedlist/version"

module DoublyLinkedlist
  class Error < StandardError; end
  # Your code goes here...
end

require 'doubly_linkedlist/list'

# Monkey patching a method to_list into the Array class.
# Usage: ary.to_list -> list
class Array
  def to_list
    DoublyLinkedlist::List.new(self)
  end
end
