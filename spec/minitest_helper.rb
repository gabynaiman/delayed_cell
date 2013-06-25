require 'coverage_helper'
require 'minitest/autorun'
require 'turn'
require 'delayed_cell'

Turn.config do |c|
  c.format = :pretty
  c.natural = true
end