require_relative 'lib/doubly_linkedlist/version'

Gem::Specification.new do |spec|
  spec.name          = "doubly_linkedlist"
  spec.version       = DoublyLinkedlist::VERSION
  spec.authors       = ["Anshab M K"]
  spec.email         = ["anshabmk@live.com"]

  spec.summary       = %q{
    An iterable, minimal Ruby implementation of a Doubly Linkedlist data structure.
  }

  spec.description   = %q{
    A Ruby implementation of the famous Doubly Linkedlist data structure with support 
    to the Enumerable methods such as `each`, `to_a`, `map`, etc. following ruby idioms. 
    Supports Queue operations as well as Stack operations. A Linkedlist is efficient in 
    many specific cases(eg:- Queue operations) than other data structures such as Array.
  }

  spec.homepage      = "https://github.com/anshabmk/doubly_linkedlist/blob/master/README.md"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/anshabmk/doubly_linkedlist"
  spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/doubly_linkedlist"
  spec.metadata["changelog_uri"] = "https://github.com/anshabmk/doubly_linkedlist/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec", "~> 3.2"
end
