# IO::Grab

Capture IO writes.

## Installation

Add this line to your application's Gemfile:

    gem 'io-grab', require: false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install io-grab

## Usage

io-grab adds #grab method to IO. (It also extends StringIO for consistency, even though it isn't really an IO.)
You can use this method to temporarily redirect writes to the object to a string, ie. for later examination.

```ruby
require 'io/grab'

STDOUT.grab { puts "foo" }
# _ == "foo\n"
```

This is particularly useful for testing, eg. to check for expected messages.

```ruby
describe "Kernel#puts" do
  it "adds a newline at the end" do
    STDOUT.grab { puts "foo" }.should =~ /\n\z/
  end
end
```

## Contributing

We welcome contributions of all kinds to this repository. For instructions on
how to get started and descriptions of our development workflows, please see our
[contributing guide](CONTRIBUTING.md).
