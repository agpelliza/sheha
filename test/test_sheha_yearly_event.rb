require 'test/unit'
require 'sheha'

class ShehaYearlyEventTest < Test::Unit::TestCase

  def test_new_yearly_event
    event = Sheha::YearlyEvent.new(12, 25)
    assert event.is_a? Sheha::YearlyEvent
  end

  def test_new_yearly_event_with_one_digit_month_and_day
    event = Sheha::YearlyEvent.new(2, 5)
    assert event.is_a? Sheha::YearlyEvent
  end

  def test_yearly_event_raise_exception_if_invalid_month
    assert_raise Sheha::InvalidMonthError do
      Sheha::YearlyEvent.new(13, 25)
    end
  end

  def test_yearly_event_raise_error_if_invalid_month_day
    assert_raise Sheha::InvalidMonthDayError do
      Sheha::YearlyEvent.new(12, 32)
    end
  end

  def test_yearly_event_has_given_month_and_day
    event = Sheha::YearlyEvent.new(12, 25)
    assert_equal(12, event.month)
    assert_equal(25, event.month_day)
  end

  def test_yearly_event_has_given_one_digit_month_and_day
    event = Sheha::YearlyEvent.new(2, 5)
    assert_equal(2, event.month)
    assert_equal(5, event.month_day)
  end

  def test_yearly_event_set_month
    event = Sheha::YearlyEvent.new(12, 25)
    event.month = 11
    assert_equal(11, event.month)
  end

  def test_yearly_event_raise_error_if_set_invalid_month
    event = Sheha::YearlyEvent.new(12, 25)
    assert_raise Sheha::InvalidMonthError do
      event.month = 13
    end
  end

  def test_yearly_event_set_month_day
    event = Sheha::YearlyEvent.new(12, 25)
    event.month_day = 26
    assert_equal(26, event.month_day)
  end

  def test_yearly_event_raise_error_if_set_invalid_month_day
    event = Sheha::YearlyEvent.new(12, 25)
    assert_raise Sheha::InvalidMonthDayError do
      event.month_day = 32
    end
  end

  def test_yearly_event_compare_as_equal
    event = Sheha::YearlyEvent.new 12, 25
    assert_equal(Sheha::YearlyEvent.new(12, 25), event)
  end

  def test_yearly_event_with_one_digit_month_and_day_compare_as_equal
    event = Sheha::YearlyEvent.new 2, 5
    assert_equal(Sheha::YearlyEvent.new(2, 5), event)
  end

  def test_yearly_event_compare_as_not_equal
    event = Sheha::YearlyEvent.new 12, 25
    assert_not_equal(Sheha::YearlyEvent.new(12, 26), event)
  end

  def test_yearly_event_with_one_digit_month_and_day_compare_as_not_equal
    event = Sheha::YearlyEvent.new 2, 5
    assert_not_equal(Sheha::YearlyEvent.new(2, 6), event)
  end

  def test_yearly_event_eql_and_hash_eval_as_equal
    set = Set.new
    set.add Sheha::YearlyEvent.new(12, 25)
    set.add Sheha::YearlyEvent.new(12, 25)
    assert_equal(1, set.size)
  end

  def test_yearly_event_eql_and_hash_eval_as_not_equal
    set = Set.new
    set.add Sheha::YearlyEvent.new(12, 25)
    set.add Sheha::YearlyEvent.new(12, 26)
    assert_equal(2, set.size)
  end

  def test_yearly_event_has_succ
    event = Sheha::YearlyEvent.new(12, 25)
    assert_equal(Sheha::YearlyEvent.new(12, 26), event.succ)
  end

  def test_yearly_event_with_one_digit_month_and_day_has_succ
    event = Sheha::YearlyEvent.new(2, 5)
    assert_equal(Sheha::YearlyEvent.new(2, 6), event.succ)
  end

  def test_yearly_events_are_ranges
    event_1 = Sheha::YearlyEvent.new(12, 25)
    event_2 = Sheha::YearlyEvent.new(12, 26)
    assert (event_1..event_2).is_a? Range
  end

  def test_yearly_event_range_between_1_and_3_has_2
    event_1 = Sheha::YearlyEvent.new(12, 25)
    event_3 = Sheha::YearlyEvent.new(12, 27)
    assert (event_1..event_3).member? Sheha::YearlyEvent.new(12, 26)
  end

  def test_yearly_event_range_is_iterable
    event_1 = Sheha::YearlyEvent.new(12, 25)
    event_3 = Sheha::YearlyEvent.new(12, 27)
    (event_1..event_3).each do |event|
      assert event.is_a? Sheha::YearlyEvent
    end
  end
end