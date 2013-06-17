require 'test/unit'
require 'sheha'

class ShehaWeeklyEventTest < Test::Unit::TestCase

  def test_new_weekly_event
    event = Sheha::WeeklyEvent.new('tuesday')
    assert event.is_a? Sheha::WeeklyEvent
  end

  def test_weekly_event_has_given_week_day
    event = Sheha::WeeklyEvent.new('tuesday')
    assert_equal('tuesday', event.week_day)
  end

  def test_weekly_event_raise_error_if_invalid_week_day
    assert_raise Sheha::InvalidWeekDayError do
      Sheha::WeeklyEvent.new('not_a_week_day')
    end
  end

  def test_weekly_event_compare_as_equal
    event = Sheha::WeeklyEvent.new 'tuesday'
    assert_equal(Sheha::WeeklyEvent.new('tuesday'), event)
  end

  def test_weekly_event_compare_as_not_equal
    event = Sheha::WeeklyEvent.new 'tuesday'
    assert_not_equal(Sheha::WeeklyEvent.new('wednesday'), event)
  end

  def test_weekly_event_eql_and_hash_eval_as_equal
    set = Set.new
    set.add Sheha::WeeklyEvent.new('tuesday')
    set.add Sheha::WeeklyEvent.new('tuesday')
    assert_equal(1, set.size)
  end

  def test_weekly_event_eql_and_hash_eval_as_not_equal
    set = Set.new
    set.add Sheha::WeeklyEvent.new('tuesday')
    set.add Sheha::WeeklyEvent.new('wednesday')
    assert_equal(2, set.size)
  end

  def test_weekly_event_has_succ
    event = Sheha::WeeklyEvent.new('tuesday')
    assert_equal(Sheha::WeeklyEvent.new('wednesday'), event.succ)
  end

  def test_weekly_events_are_ranges
    event_1 = Sheha::WeeklyEvent.new('tuesday')
    event_2 = Sheha::WeeklyEvent.new('wednesday')
    assert (event_1..event_2).is_a? Range
  end

  def test_weekly_event_range_between_1_and_3_has_2
    event_1 = Sheha::WeeklyEvent.new('tuesday')
    event_3 = Sheha::WeeklyEvent.new('thursday')
    assert (event_1..event_3).member? Sheha::WeeklyEvent.new('wednesday')
  end

  def test_weekly_event_range_is_iterable
    event_1 = Sheha::WeeklyEvent.new('tuesday')
    event_3 = Sheha::WeeklyEvent.new('thursday')
    (event_1..event_3).each do |event|
      assert event.is_a? Sheha::WeeklyEvent
    end
  end
end