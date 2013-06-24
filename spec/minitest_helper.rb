require 'coverage_helper'
require 'minitest/autorun'
require 'turn'
require 'logger_proxy'

Turn.config do |c|
  c.format = :pretty
  c.natural = true
end

class FakeLogger
  attr_reader :last_message

  LoggerProxy::LEVELS.each do |level|
    define_method level do |message|
      @last_message = message
    end
  end
end
