#!/usr/bin/ruby -w

require "test/unit"
require "./test_human"
require "./stable_marriage"

class TestStableMarriages < Test::Unit::TestCase

  def test_print_a_couple
    man = Human.new(name: 'Joey')
    woman = Human.new(name: 'Monica')
    man.partner = woman
    assert_equal "Joey -- Monica\n", print_couple(man)
  end

  def test_no_people_no_marriages
    assert_equal "", compute([],[])
  end

  def test_two_people_one_marriage
    women = [Human.new(name: 'Monica')]
    men = [Human.new(name: 'Joey',pref: women)]
    assert_equal "Joey -- Monica\n", compute(men,women)

    women = [Human.new(name: 'Racheal')]
    men = [Human.new(name: 'Ross',pref: women)]
    assert_equal "Ross -- Racheal\n", compute(men,women)
  end

  def test_four_people_two_marriages
    men = []
    women = []
    monica = Human.new(name: 'Monica')
    racheal = Human.new(name: 'Racheal')
    men << Human.new(name: 'Joey', pref: [monica,racheal])
    men << Human.new(name: 'Ross', pref: [racheal,monica])
    assert_equal "Joey -- Monica\nRoss -- Racheal\n", compute(men,women)
  end
end

