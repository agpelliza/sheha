require 'test/unit'
require 'sheha'

class ShehaHelperTest < Test::Unit::TestCase

  def test_helper_valid_month
    assert Sheha::Helper.valid_month?(12)
  end

  def test_helper_invalid_month
    assert !Sheha::Helper.valid_month?(13)
  end

  def test_helper_valid_month_day
    assert Sheha::Helper.valid_month_day?(25)
  end

  def test_helper_invalid_month_day
    assert !Sheha::Helper.valid_month_day?(32)
  end

  def test_helper_valid_week_day
    assert Sheha::Helper.valid_week_day?('tuesday')
  end

  def test_helper_invalid_week_day
    assert !Sheha::Helper.valid_week_day?('not_a_week_day')
  end

  def test_helper_validate_valid_month
    assert_equal(nil, Sheha::Helper.validate_month(12))
  end

  def test_helper_validate_invalid_month
    assert_raise Sheha::InvalidMonthError do
      Sheha::Helper.validate_month(13)
    end
  end

  def test_helper_validate_valid_month_day
    assert_equal(nil, Sheha::Helper.validate_month_day(25))
  end

  def test_helper_validate_invalid_month_day
    assert_raise Sheha::InvalidMonthDayError do
      Sheha::Helper.validate_month_day(32)
    end
  end

  def test_helper_validate_valid_week_day
    assert_equal(nil, Sheha::Helper.validate_week_day('tuesday'))
  end

  def test_helper_validate_invalid_week_day
    assert_raise Sheha::InvalidWeekDayError do
      Sheha::Helper.validate_week_day('not_a_week_day')
    end
  end

  def test_helper_week_day_at_index
    assert_equal('tuesday', Sheha::Helper.week_day_at(3))
  end

  def test_helper_find_week_day_index
    assert_equal(3, Sheha::Helper.find_week_day_index('tuesday'))
  end
end