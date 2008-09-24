#tags: foo

require 'rubygems'
require 'need'
need { 'spec_helper' }
need { '../lib/taza/site' }

describe Site do
  before :all do
    Foo = Class.new(Site)
    Foo.any_instance.stubs(:path).returns(File.join("spec","pages","foo","*.rb"))
  end

  it "should respond to a method correlating to a page class" do
    f = Foo.new
    f.respond_to?(:bar).should == true
  end
  
  it "should yield an instance of a page class" do
    f = Foo.new
    barzor = nil
    f.bar do |bar|
      barzor = bar
    end 
    barzor.should be_an_instance_of(Bar)
  end

end
