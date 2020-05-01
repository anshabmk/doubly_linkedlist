#require 'doubly_linkedlist/list'
require 'spec_helper'

RSpec.describe DoublyLinkedlist::List do
  let(:subject) { DoublyLinkedlist::List }

  it 'should initialize with the count of elements in values array' do
    values = Array.new(Random.rand(10), Random.rand(100))

    expect(subject.new(values).count).to eql(values.size)
  end
end
