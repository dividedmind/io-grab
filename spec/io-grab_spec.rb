require 'io/grab'
require 'stringio'

describe "IO#grab" do
  let(:io) { StringIO.new }

  it "catches the output correctly" do
    io.grab { puts "foo" }.should == "foo\n"
  end

  it "doesn't pass the output to the original implementation" do
    io.grab { puts "foo" }
    io.string.should be_empty
  end

  it "reverts the grab when it's done" do
    io.grab { puts "foo" }
    io.puts "bar"
    io.string.should == "bar\n"
  end
end
