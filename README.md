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

#### Initialization

There are two different ways to initialize a linkedlist including one which converting an array into a list by calling `to_list` method on the array object.

You can find the examples below.

```ruby
    # You can pass an array as argument which
    # will be the created list's node values.
    list = DoublyLinkedlist.new([obj1, obj2, ...])

    # Argument is optional. If not given,
    # a empty list is created.
    list1 = DoublyLinkedlist.new
```
#### Methods

```ruby
    list.count # => returns the number of nodes in the list

    list.head # => returns the node value at the list's head. (Alias: first)

    list.tail # => returns the node value at the list's tail. (Alias: last)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anshabmk/doubly_linkedlist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/anshabmk/doubly_linkedlist/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DoublyLinkedlist project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/anshabmk/doubly_linkedlist/blob/master/CODE_OF_CONDUCT.md).
