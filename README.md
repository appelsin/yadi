Yet another dependency injection container.

## Why?

* No need to pre-fill container
* Classes can be used without a container

## Usage

#### Auto-inject classes

```ruby
class Foo; end
class Bar; end

class Baz
  # this tells to inject Foo instance as first argument and Bar as bar: option
  include Yadi::Inject('Foo', bar: 'Bar')
  def initialize(foo, bar:)
    @foo, @bar = foo, bar
  end
end

container = Yadi::Container.new
baz = container.make('Baz')

# this gives the same result
baz = Baz.new(Foo.new, bar: Bar.new)
```

#### Auto-inject in service container style

```ruby
class Foo; end
class Bar; end

class Baz
  # this tells to inject values from container
  include Yadi::Inject('service.foo', bar: 'config.bar')
  def initialize(foo, bar:)
    @foo, @bar = foo, bar
  end
end

container = Yadi::Container.new
container['service.foo'] = Foo.new
container['config.bar'] = 'bar'
baz = container.make('Baz')

# this gives the same result
baz = Baz.new(Foo.new, bar: 'bar')
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yadi'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:
```sh
$ gem install yadi
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/appelsin/yadi.