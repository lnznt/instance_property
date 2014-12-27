# InstanceProperty

Instance property for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instance_property'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install instance_property

## Usage

```ruby
reqiure 'instance_property'

class MyClass
  extend InstanceProperty
end

# or

class Module
  include InstanceProperty
end
```

Module InstanceProperty has two methods ('property' and 'properties').

'property' is a method such as 'attr_accessor'.

```ruby
class MyClass
  extend InstanceProperty

  property :foo1
  property :foo2, 20			# with initial value
  property(:foo3) { 30 }		# with initial value (given as the block)
end

obj = MyClass.new

p obj.foo1			#=> nil
p obj.foo2			#=> 20
p obj.foo3			#=> 30

obj.foo1 10
p obj.foo1          #=> 10
```

```ruby
class MyClass
  extend InstanceProperty

  property :foo, 100
  property(:bar) { foo + 20 }
  property(:baz) { bar +  3 }
end

obj1 = MyClass.new
p obj1.baz		#=> 123		# (foo=100) + (bar=20) + 3

obj2 = MyClass.new
obj2.foo = 900
p obj2.baz		#=> 923		# (foo=900) + (bar=20) + 3

obj3 = MyClass.new
obj3.bar = 90
p obj3.baz		#=> 93		# (bar=90) + 3

```

```ruby
class MyClass
  extend InstanceProperty

  properties :foo1, :foo2
  properties(:foo3, :foo4) { 400 }
end

# same as

class MyClass
  extend InstanceProperty

  property :foo1
  property :foo2
  property(:foo3) { 400 }
  property(:foo4) { 400 }
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/instance_property/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
