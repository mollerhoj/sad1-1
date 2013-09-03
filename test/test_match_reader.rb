#!/usr/bin/ruby -w

require "test/unit"
require_relative "../match_reader"

class TestMatchReader < Test::Unit::TestCase

  def setup
    @monica = Human.new('Monica')
    @rachel = Human.new('Rachel')
    @phoebe = Human.new('Phoebe')
    @joey = Human.new('Joey', [@rachel,@phoebe,@monica,])
    @ross = Human.new('Ross', [@rachel,@phoebe,@monica])
    @chandler = Human.new('Chandler', [@monica,@rachel,@phoebe])
    @monica.pref = [@chandler,@joey,@ross]
    @rachel.pref = [@ross,@joey,@chandler]
    @phoebe.pref = [@joey,@ross,@chandler]

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

  def test_ross_and_monica
    @reader.read('input/two_people.in')
    assert_equal 1 , @reader.amount
    assert_equal [@ross], @reader.men
    assert_equal [@monica], @reader.men.first.pref
  end

  def test_friends
    @reader.read('input/stable-marriage-friends.in')
    assert_equal 3 , @reader.amount
    assert_equal [@ross,@chandler,@joey], @reader.men
    new_ross = @reader.men.find{|o| o == @ross}
    new_joey = @reader.men.find{|o| o == @joey}
    new_chandler = @reader.men.find{|o| o == @chandler}
    assert_equal [@rachel,@phoebe,@monica], new_ross.pref
    assert_equal [@rachel,@phoebe,@monica], new_joey.pref
    assert_equal [@monica,@rachel,@phoebe], new_chandler.pref
  end

end
