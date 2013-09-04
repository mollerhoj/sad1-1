#!/usr/bin/ruby -w

require "test/unit"
require_relative "../match_reader"
require_relative "../stable_marriage"

class TestIntegration < Test::Unit::TestCase
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
    @reader = MatchReader.new
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

  def test_50_worst
    f_in =  'input/stable-marriage-worst-50.in' 
    f_out = 'input/stable-marriage-worst-50.out' 
    check f_in, f_out
  end

  def test_500_random
    f_in =  'input/stable-marriage-random-500.in' 
    f_out = 'input/stable-marriage-random-500.out' 
    check f_in, f_out
  end

  def test_500_worst
    f_in =  'input/stable-marriage-worst-500.in' 
    f_out = 'input/stable-marriage-worst-500.out' 
    check f_in, f_out
  end

  def test_5000_worst
    f_in =  'input/stable-marriage-worst-5000.in' 
    f_out = 'input/stable-marriage-worst-5000.out' 
    check f_in, f_out
  end

  def check f_in,f_out
    @reader.read(f_in)
    puts 'Reading done!'
    @cupid.match @reader.men
    assert_equal File.open(f_out).read, @cupid.print_couples(@reader.men)
  end
end
