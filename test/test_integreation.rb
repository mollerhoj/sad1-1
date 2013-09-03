#!/usr/bin/ruby -w

require "test/unit"
require "../match_reader"
require "../stable_marriage"

class TestIntegration < Test::Unit::TestCase
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
    @cupid = Cupid.new
  end

  def test_friends
    f_in =  'input/stable-marriage-friends.in' 
    f_out = 'input/stable-marriage-friends.out' 
    check f_in, f_out
  end

  def test_illiad
    f_in =  'input/stable-marriage-illiad.in' 
    f_out = 'input/stable-marriage-illiad.out' 
    check f_in, f_out
  end

  def test_5_people
    f_in =  'input/stable-marriage-kt-p-5.in' 
    f_out = 'input/stable-marriage-kt-p-5.out' 
    check f_in, f_out
  end

  def test_50_random
    f_in =  'input/stable-marriage-random-50.in' 
    f_out = 'input/stable-marriage-random-50.out' 
    check f_in, f_out
  end

  def test_500_random
    f_in =  'input/stable-marriage-random-500.in' 
    f_out = 'input/stable-marriage-random-500.out' 
    #check f_in, f_out
  end

  def check f_in,f_out
    @reader.read(f_in)
    @cupid.match @reader.men
    assert_equal File.open(f_out).read, @cupid.print_couples(@reader.men)
  end



end
