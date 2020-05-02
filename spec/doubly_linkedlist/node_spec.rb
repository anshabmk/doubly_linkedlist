require 'spec_helper'

RSpec.describe DoublyLinkedlist::Node do
  let(:subject) { DoublyLinkedlist::Node }
  let(:random_value) { Random.rand(1000) }

  context '#initialize' do
    it 'should initialize a node with the given object as its value' do
      value = random_value
      node = subject.new(value)

      expect(node.instance_variable_get('@value')).to eql(value)
    end

    it 'should initialize a node with no next and prev pointers' do
      node = subject.new(random_value)

      expect(node.instance_variable_get('@next')).to be nil
      expect(node.instance_variable_get('@prev')).to be nil
    end
  end

  context '#value' do
    it 'should expose a getter method for @value' do
      node = subject.new(random_value)
      value = node.instance_variable_get('@value')

      expect(node.value).to eql(value)
    end

    it 'should not expose a setter method for @value' do
      node = subject.new(random_value)

      expect { node.value = random_value }.to raise_error(NoMethodError)
    end
  end

  context '#next' do
    it 'should expose a getter method for @next' do
      node = subject.new(random_value)
      next_node = subject.new(random_value)

      node.instance_variable_set('@next', next_node)

      expect(node.next).to eql(next_node)
    end

    it 'should expose a setter method for @next' do
      node = subject.new(random_value)

      expect { node.next = subject.new(random_value) }.not_to raise_error
    end
  end

  context '#prev' do
    it 'should expose a getter method for @prev' do
      node = subject.new(random_value)
      prev_node = subject.new(random_value)

      node.instance_variable_set('@prev', prev_node)

      expect(node.prev).to eql(prev_node)
    end

    it 'should expose a setter method for @prev' do
      node = subject.new(random_value)

      expect { node.prev = subject.new(random_value) }.not_to raise_error
    end
  end
end
