# DoublyLinkedlist

A Ruby implementation of the famous Doubly Linkedlist data structure following ruby idioms. A Linkedlist is efficient in many specific cases than other data structures such as Array.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'doubly_linkedlist'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install doubly_linkedlist

## Usage

### Initialization

There are different ways to initialize a linkedlist including the one which converting an array into a list by calling `to_list` method on the array object.

You can find the examples below.

```ruby
# You can pass an array as argument whose elements will be the created list's node values.
list = DoublyLinkedlist::List.new([obj1, obj2, ...])

# Argument is optional. If not given, a empty list with no nodes is created.
empty_list = DoublyLinkedlist::List.new

# You can also use `to_list` method on an array object to create a new list object.
another_list = [obj1, obj2, ...].to_list

another_list.class # => DoublyLinkedlist::List
```

### Methods

#### General methods

##### #count

Returns the number of nodes in the list.

Examples are shown below,

```ruby
empty_list = DoublyLinkedlist::List.new

empty_list.count # => 0

another_list = [10, 20, 40, 30].to_list

another_list.count # => 4
```

##### #head (also: #first)

Returns the value at the head of the list if present, `nil` otherwise.

```ruby
list = [10, 20, 40, 50].to_list

list.head # => 10
list.first # => 10

empty_list = DoublyLinkedlist::List.new

empty_list.head # => nil
```

##### #tail (also: #last)

Returns the value at the tail of the list if present, `nil` otherwise.

```ruby
list = [10, 20, 40, 50].to_list

list.tail # => 50
list.last # => 50

empty_list = DoublyLinkedlist::List.new

empty_list.tail # => nil
```

##### #find_at(index)

Returns the node object at the given index if present, `nil` otherwise.

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100]

list.find_at(1) # => "Some object"
list.find_at(4) # => nil
```

##### #index(value) and #rindex(value)

Returns the leftmost(`#index`)/rightmost(`#rindex`) index of the value present in the list, 
`nil` if not present.

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100, 40]

list.index(40) # => 2
list.rindex(40) # => 4

list.index(200) # => nil
```

##### #delete_at(index)

Deletes the node at a given index and returns the value present in the
deleted node. Returns `nil` if the given index is out of range.

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100, 40]
list.count # => 5

list.delete_at(1) # => "Some object"
list # => [1, 40, 100, 40]
list.count # => 4

list.delete_at(6) # => nil
list.count # => 4
```

##### #to_a

Converts the list object into an array object with all the node values.

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100, 40]

arr = list.to_a
arr.class # => Array
arr # => [1, "Some object", 40, 100, 40]
```

#### Stack Operations

##### #push(obj)

Inserts a node with the given value into the head of the list,
increments and returns the count of nodes.

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100, 40]

list.push(25) # => 6
list # => [25, 1, "Some object", 40, 100, 40]
```

##### #pop

Deletes and returns the node value at the head of the list.

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100, 40]

list.pop # => 1
list.count # => 4
list # => ["Some object", 40, 100, 40]
```

#### Queue Operations

##### #enqueue(obj)

Appends a node with the given value into tail of the list,
increments and returns the count of nodes.

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100, 40]

list.enqueue(25) # => 6
list # => [1, "Some object", 40, 100, 40, 25]
```

##### #deque

Deletes and returns the node value at the head of the list. (Same as `#pop`)

```ruby
list = DoublyLinkedlist::List.new [1, "Some object", 40, 100, 40]

list.deque # => 1
list.count # => 4
list # => ["Some object", 40, 100, 40]
```

Refer [documentation](https://rubydoc.info/gems/doubly_linkedlist/DoublyLinkedlist/) for more information.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anshabmk/doubly_linkedlist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/anshabmk/doubly_linkedlist/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DoublyLinkedlist project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/anshabmk/doubly_linkedlist/blob/master/CODE_OF_CONDUCT.md).
