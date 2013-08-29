#!/usr/bin/ruby -w

require "test/unit"
require "./stable_marriage"

#TEST

class TestStableMarriages < Test::Unit::TestCase

  def test_no_people_no_marriages
    assert compute(nil,nil)==nil
  end

  def test_two_people_one_marriage
    assert compute(2,
  end

end

