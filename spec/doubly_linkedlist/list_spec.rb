#require 'doubly_linkedlist/list'
require 'spec_helper'

RSpec.describe DoublyLinkedlist::List do
  let(:subject) { DoublyLinkedlist::List }

  context '#initialize' do
    it "should initialize a list with proper order of head and tail" do
      arr = [10, 20, 40, 'Some String', { test: 'test' }]
      list = subject.new(arr)

      expect(list.head).to eql(arr.first)
      expect(list.tail).to eql(arr.last)
    end

    it 'should initialize with an optional array as argument' do
      expect { subject.new }.not_to raise_error
      expect { subject.new([1, 20, 4]) }.not_to raise_error
    end
  end

  context '#head' do
    it 'should not have a head when there are no nodes' do
      expect(subject.new.head).to be nil
    end

    let(:arr) { [Random.rand(100), 20, 40, 30] }

    it 'should have the first element in the array as the list head' do
      expect(subject.new(arr).head).to eql(arr.first)
    end

    it 'should have an alias named :first' do
      list = subject.new(arr)

      expect(list.head == list.first).to be true
    end
  end

  context '#tail' do
    it 'should not have a tail when there are no nodes' do
      expect(subject.new.tail).to be nil
    end

    let(:arr) { [20, 40, 30, Random.rand(100)] }

    it 'should have the last element in the array as the list tail' do
      expect(subject.new(arr).tail).to eql(arr.last)
    end

    it 'should have an alias named :last' do
      list = subject.new(arr)

      expect(list.tail == list.last).to be true
    end
  end

  context '#count' do
    it 'should initialize with the count of elements in values array' do
      values = Array.new(Random.rand(10), Random.rand(100))

      expect(subject.new(values).count).to eql(values.size)
      expect(subject.new.count).to eql(0)
    end

    it 'should not expose an interface to set count explicitly' do
      list = subject.new

      expect { list.count = Random.rand(10) }.to raise_error(NoMethodError)
    end
  end
end
