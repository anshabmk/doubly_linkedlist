require "doubly_linkedlist/version"

# Namespace for DoublyLinkedlist
module DoublyLinkedlist
  # Standard Error class
  class Error < StandardError; end
end

require 'doubly_linkedlist/list'

# Monkey patching a method to_list into the Array class.
class Array
  # Converts a given array into a linkedlist.
  #
  # @return [DoublyLinkedlist::List] the linkedlist object with array elements as node values.
  def to_list
    DoublyLinkedlist::List.new(self)
  end
end
