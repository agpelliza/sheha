require 'test/unit'
require 'sheha'

class ShehaMonthlyEventTest < Test::Unit::TestCase

  def test_new_monthly_event
    event = Sheha::MonthlyEvent.new(25)
    assert event.is_a? Sheha::MonthlyEvent
  end

  def test_monthly_event_has_given_month_day
    event = Sheha::MonthlyEvent.new(25)
    assert_equal(25, event.month_day)
  end

  def test_monthly_event_raise_error_if_invalid_month_day
    assert_raise Sheha::InvalidMonthDayError do
      Sheha::MonthlyEvent.new(32)
    end
  end

  def test_monthly_event_compare_as_equal
    event = Sheha::MonthlyEvent.new 25
    assert_equal(Sheha::MonthlyEvent.new(25), event)
  end

  def test_monthly_event_compare_as_not_equal
    event = Sheha::MonthlyEvent.new 25
    assert_not_equal(Sheha::MonthlyEvent.new(26), event)
  end

  def test_monthly_event_eql_and_hash_eval_as_equal
    set = Set.new
    set.add Sheha::MonthlyEvent.new(25)
    set.add Sheha::MonthlyEvent.new(25)
    assert_equal(1, set.size)
  end

  def test_monthly_event_eql_and_hash_eval_as_not_equal
    set = Set.new
    set.add Sheha::MonthlyEvent.new(25)
    set.add Sheha::MonthlyEvent.new(26)
    assert_equal(2, set.size)
  end

  def test_monthly_event_has_succ
    event = Sheha::MonthlyEvent.new(25)
    assert_equal(Sheha::MonthlyEvent.new(26), event.succ)
  end

  def test_monthly_events_are_ranges
    event_1 = Sheha::MonthlyEvent.new(25)
    event_2 = Sheha::MonthlyEvent.new(26)
    assert (event_1..event_2).is_a? Range
  end

  def test_monthly_event_range_between_1_and_3_has_2
    event_1 = Sheha::MonthlyEvent.new(25)
    event_3 = Sheha::MonthlyEvent.new(27)
    assert (event_1..event_3).member? Sheha::MonthlyEvent.new(26)
  end

  def test_monthly_event_range_is_iterable
    event_1 = Sheha::MonthlyEvent.new(25)
    event_3 = Sheha::MonthlyEvent.new(27)
    (event_1..event_3).each do |event|
      assert event.is_a? Sheha::MonthlyEvent
    end
  end
end