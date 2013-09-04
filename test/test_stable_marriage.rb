#!/usr/bin/ruby -w

require "test/unit"
require_relative "../stable_marriage"

class TestStableMarriages < Test::Unit::TestCase

  def setup
    @monica = Human.new('Monica')
    @racheal = Human.new('Racheal')
    @phoebe = Human.new('Phoebe')
    @joey = Human.new('Joey', [@racheal,@phoebe,@monica,])
    @ross = Human.new('Ross', [@racheal,@phoebe,@monica])
    @chandler = Human.new('Chandler', [@monica,@racheal,@phoebe])
    @monica.pref = {@chandler => 1,@joey => 2,@ross => 3}
    @racheal.pref = {@ross => 1,@joey => 2,@chandler => 3}
    @phoebe.pref = {@joey => 1,@ross => 2,@chandler => 3}

    @cupid = Cupid.new
  end

  def test_print_a_couple
    @joey.partner = @monica
    assert_equal "Joey -- Monica\n", @cupid.print_couple(@joey)
  end

  def test_no_people_no_marriages
    assert_equal nil, @cupid.match([])
  end

  def test_two_people
    @cupid.match([@joey])
    assert_equal @racheal, @joey.partner
  end

  def test_four_people
    @cupid.match([@joey,@ross])
    assert_equal @phoebe, @joey.partner
    assert_equal @racheal, @ross.partner
  end

  def test_all_people
    @cupid.match([@joey,@ross,@chandler])
    assert_equal @phoebe, @joey.partner
    assert_equal @racheal, @ross.partner
    assert_equal @monica, @chandler.partner
    #@cupid.match([@chandler,@joey,@ross])
    #assert_equal @phoebe, @joey.partner
    #assert_equal @racheal, @ross.partner
    #assert_equal @monica, @chandler.partner
  end

  def test_stealing_women
    @joey.marry @racheal
    @ross.marry @racheal
    assert_equal nil , @joey.partner
    assert_equal @racheal , @ross.partner
  end

  def test_monogamasy
    @joey.marry @monica
    @joey.marry @racheal
    assert_equal @racheal , @joey.partner
    assert_equal @joey , @racheal.partner
    assert_equal nil , @monica.partner
  end
end

