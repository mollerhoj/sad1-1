require "test/unit"
require "./stable_marriage"

class TestHuman < Test::Unit::TestCase

  def test_woman_prefer
    monica = Human.new
    joey = Human.new
    chandler = Human.new
    ross = Human.new

    monica.pref = [joey,chandler,ross]
    monica.marry chandler
    assert_equal false , monica.prefer(ross)
    assert_equal false , monica.prefer(chandler)
    assert_equal true, monica.prefer(joey)
  end
end
