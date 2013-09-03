require "test/unit"
require_relative "../stable_marriage"

class TestHuman < Test::Unit::TestCase

  def setup
    @monica = Human.new('Monica')
    @racheal = Human.new('Racheal')
    @phoebe = Human.new('Racheal')
    @joey = Human.new('Joey', [@racheal,@phoebe,@monica,])
    @ross = Human.new('Ross', [@racheal,@phoebe,@monica])
    @chandler = Human.new('Chandler', [@monica,@racheal,@phoebe])
    @monica.pref = [@chandler,@joey,@ross]
    @racheal.pref = [@ross,@joey,@chandler]
    @phoebe.pref = [@joey,@ross,@chandler]
  end

  def test_woman_prefer
    @monica.pref = [@joey,@chandler,@ross]
    @monica.marry @chandler
    assert_equal false , @monica.prefer(@ross)
    assert_equal false , @monica.prefer(@chandler)
    assert_equal true, @monica.prefer(@joey)
  end
end
