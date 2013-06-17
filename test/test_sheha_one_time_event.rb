require 'test/unit'
require 'sheha'

class ShehaOneTimeEventTest < Test::Unit::TestCase

  def test_new_one_time_event
    event = Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    assert event.is_a? Sheha::OneTimeEvent
  end

  def test_one_time_event_has_given_date
    event = Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    assert_equal(Date.new(2012, 12, 25), event.date)
  end

  def test_one_time_event_compare_as_equal
    event = Sheha::OneTimeEvent.new Date.new(2012, 12, 25)
    assert_equal(Sheha::OneTimeEvent.new(Date.new(2012, 12, 25)), event)
  end

  def test_one_time_event_compare_as_not_equal
    event = Sheha::OneTimeEvent.new Date.new(2012, 12, 25)
    assert_not_equal(Sheha::OneTimeEvent.new(Date.new(2012, 12, 26)), event)
  end

  def test_one_time_event_eql_and_hash_eval_as_equal
    set = Set.new
    set.add Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    set.add Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    assert_equal(1, set.size)
  end

  def test_one_time_event_eql_and_hash_eval_as_not_equal
    set = Set.new
    set.add Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    set.add Sheha::OneTimeEvent.new(Date.new(2012, 12, 26))
    assert_equal(2, set.size)
  end

  def test_one_time_event_has_succ
    event = Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    assert_equal(Sheha::OneTimeEvent.new(Date.new(2012, 12, 26)), event.succ)
  end

  def test_one_time_events_are_ranges
    event_1 = Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    event_2 = Sheha::OneTimeEvent.new(Date.new(2012, 12, 26))
    assert (event_1..event_2).is_a? Range
  end

  def test_one_time_event_range_between_1_and_3_has_2
    event_1 = Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    event_2 = Sheha::OneTimeEvent.new(Date.new(2012, 12, 27))
    assert (event_1..event_2).member? Sheha::OneTimeEvent.new(Date.new(2012, 12, 26))
  end

  def test_one_time_event_range_is_iterable
    event_1 = Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))
    event_2 = Sheha::OneTimeEvent.new(Date.new(2012, 12, 27))
    (event_1..event_2).each do |event|
      assert event.is_a? Sheha::OneTimeEvent
    end
  end
end