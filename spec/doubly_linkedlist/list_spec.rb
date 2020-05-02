require 'spec_helper'

RSpec.describe DoublyLinkedlist::List do
  let(:subject) { DoublyLinkedlist::List }

  let(:random_arr) do
    size = Random.rand(5..10)

    size.times.map { Random.rand(1000) }
  end

  context '#initialize' do
    it "should initialize a list with proper order of head and tail" do
      arr = [10, 20, 40, 'Some String', { test: 'test' }]
      list = subject.new(arr)

      expect(list.head).to eql(arr.first)
      expect(list.tail).to eql(arr.last)
    end

    it 'should initialize with an optional array as argument' do
      expect { subject.new }.not_to raise_error
      expect { subject.new(random_arr) }.not_to raise_error
    end
  end

  context '#head and #tail' do
    it 'should not have a head or a tail when there are no nodes' do
      expect(subject.new.head).to be nil
      expect(subject.new.tail).to be nil
    end

    it 'should have the first and last element in the array as the list head and tail respectively' do
      arr = random_arr

      expect(subject.new(arr).head).to eql(arr.first)
      expect(subject.new(arr).tail).to eql(arr.last)
    end

    it 'should have an alias named #first for #head and #last for #tail' do
      list = subject.new(random_arr)

      expect(list.head == list.first).to be true
      expect(list.tail == list.last).to be true
    end
  end

  context '#count' do
    it 'should initialize with the count of elements in values array' do
      values = random_arr

      expect(subject.new(values).count).to eql(values.size)
      expect(subject.new.count).to eql(0)
    end

    it 'should not expose an interface to set count explicitly' do
      list = subject.new

      expect { list.count = Random.rand(10) }.to raise_error(NoMethodError)
    end
  end

  context '#find_at(index)' do
    it 'should return the node value at the given index if present' do
      arr = random_arr
      list = subject.new(arr)
      i = arr.size.times.map { |i| i }.sample

      expect(list.find_at(i)).to eql(arr[i])
    end

    it 'should return nil if the given index is out of range' do
      arr = random_arr
      list = subject.new(arr)
      i = arr.size + Random.rand(10) # out of range index
      j = -(Random.rand(1..10)) # another less than zero out of range index

      expect(list.find_at(i)).to be nil
      expect(list.find_at(j)).to be nil
    end
  end

  context '#index(value) and #rindex(value)' do
    it 'should return the left index and right index of the value passed' do
      arr = [10, 2, 30, 10, 5]
      list = subject.new(arr)

      expect(list.index(10)).to eql(arr.index(10))
      expect(list.rindex(10)).to eql(arr.rindex(10))
    end

    it 'should return nil if the value is not present' do
      arr = random_arr
      list = subject.new(arr)
      ele = Random.rand(1000)

      while arr.include?(ele) do
        ele = ele.next
      end

      expect(list.index(ele)).to be nil
      expect(list.rindex(ele)).to be nil
    end
  end

  context '#insert(value) (also: #push)' do
    it 'should insert a node at the head and return the updated count' do
      list = subject.new(random_arr)
      ele = Random.rand(100)
      curr_nodes_count = list.count

      expect(list.push(ele)).to eql(curr_nodes_count + 1)
      expect(list.head).to eql(ele)
    end
  end

  context '#enqueue(value)' do
    it 'should insert a node at the tail and return the updated count' do
      list = subject.new(random_arr)
      ele = Random.rand(100)
      curr_nodes_count = list.count

      expect(list.enqueue(ele)).to eql(curr_nodes_count + 1)
      expect(list.tail).to eql(ele)
    end
  end

  context '#delete_at(index)' do
    it 'should return the deleted node value object and decrement the count' do
      list = subject.new(random_arr)
      i = Random.rand(list.count - 1)
      ele = list.find_at(i)
      curr_count = list.count

      expect(list.delete_at(i)).to eql(ele)
      expect(list.count).to eql(curr_count - 1)
    end

    it 'should update head if index zero(0) is given (same as #pop and #deque)' do
      list = subject.new([10, 20, 30, 40])
      prev_head = list.first
      list.delete_at(0)

      expect(list.head).to eql(20)

      list.pop

      expect(list.head).to eql(30)

      list.deque

      expect(list.head).to eql(40)
    end

    it 'should update the tail if the node at tail is deleted' do
      list = subject.new([10, 20, 30, 40])
      prev_tail = list.last
      list.delete_at(list.count - 1)

      expect(list.tail).to eql(30)
    end

    it 'should return nil if the given index is out of range' do
      arr = random_arr
      list = subject.new(arr)
      i = arr.size + Random.rand(10) # out of range index
      j = -(Random.rand(1..10)) # another less than zero out of range index

      expect(list.delete_at(i)).to be nil
      expect(list.delete_at(j)).to be nil
    end
  end

  context '#to_a' do
    it 'should convert the list into an array object' do
      arr = random_arr
      list = subject.new(arr)
      list_to_arr = list.to_a

      expect(list_to_arr.class).to be(Array)
      expect(list_to_arr).to eql(arr)
    end

    it 'should convert an empty list into an empty array' do
      expect(subject.new.to_a).to eql([])
    end
  end

  context '#to_s (also: #inspect)' do
    it 'should convert the array representation of list into a string' do
      list = subject.new(random_arr)

      expect(list.to_s).to eql(list.to_a.to_s)
    end

    it 'should convert an empty list into a string' do
      expect(subject.new.inspect).to eql([].to_s)
    end
  end
end
