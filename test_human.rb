class TestHuman < Test::Unit::TestCase

  def test_woman_prefer
    monica = Human.new(name: 'Monica')
    joey = Human.new(name: 'Joey')
    chandler = Human.new(name: 'Chandler')

    monica.pref = [joey,chandler]
    assert_equal monica.prefer(joey,chandler), true
    assert_equal monica.prefer(chandler,joey), false
  end
end
