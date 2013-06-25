require 'minitest_helper'

describe 'Test' do

  class Model
    include DelayedCell::Delay
    def initialize(name)
      @name = name
      @filename = "#{File.dirname(__FILE__)}/#{@name}.log"
      File.delete @filename if File.exists? @filename
    end
    def slow_method(arg)
      File.open @filename, 'a' do |f|
        f.puts "#{@name} => Slow method: #{arg}"
      end
      sleep 1
    end
  end

  it 'sample' do
    5.times do |i|
      model = Model.new "Model #{i}"
      3.times { |y| model.delay.slow_method y }
    end
    sleep 3
  end
end