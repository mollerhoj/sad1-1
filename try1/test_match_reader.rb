#!/usr/bin/ruby -w

require "test/unit"
require "./match_reader"

class TestMatchReader < Test::Unit::TestCase

  def setup
    @reader = MatchReader.new
  end

  def test_empty_file
    assert_nil @reader.read('input/empty.in')
    assert_equal nil , @reader.amount
  end

  def test_zero_people
    @reader.read('input/zero_people.in')
    assert_equal 0 , @reader.amount
  end

  def test_amount_set
    @reader.read('input/two_people.in')
    assert_equal 1 , @reader.amount
  end

  def test_comments
    @reader.read('input/two_people_with_comments.in')
    assert_equal 1 , @reader.amount
  end

  def test_two_people
    @reader.read('input/two_people.in')
    assert_equal 1 , @reader.amount
    assert_equal "Ross", @reader.men
  end

end
