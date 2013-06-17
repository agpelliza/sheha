require 'test/unit'
require 'sheha'

class ShehaEventTest < Test::Unit::TestCase
  
  def test_new_event
    event = Sheha::Event.new 'my_id'
    assert event.is_a? Sheha::Event
  end

  def test_event_compare_as_equal
    event = Sheha::Event.new 'my_id'
    assert_equal(Sheha::Event.new('my_id'), event)
  end

  def test_event_compare_as_not_equal
    event = Sheha::Event.new 'my_id'
    assert_not_equal(Sheha::Event.new('other_id'), event)
  end

  def test_event_eql_and_hash_eval_as_equal
    set = Set.new
    set.add Sheha::Event.new('my_id')
    set.add Sheha::Event.new('my_id')
    assert_equal(1, set.size)
  end

  def test_event_eql_and_hash_eval_as_not_equal
    set = Set.new
    set.add Sheha::Event.new('my_id')
    set.add Sheha::Event.new('other_id')
    assert_equal(2, set.size)
  end

  def test_event_has_succ
    event = Sheha::Event.new(1)
    assert_equal(Sheha::Event.new(2), event.succ)
  end

  def test_events_are_ranges
    event_1 = Sheha::Event.new(1)
    event_2 = Sheha::Event.new(2)
    assert (event_1..event_2).is_a? Range
  end

  def test_event_range_between_1_and_3_has_2
    event_1 = Sheha::Event.new(1)
    event_3 = Sheha::Event.new(3)
    assert (event_1..event_3).member? Sheha::Event.new(2)
  end

  def test_event_range_is_iterable
    event_1 = Sheha::Event.new(1)
    event_3 = Sheha::Event.new(3)
    (event_1..event_3).each do |event|
      assert event.is_a? Sheha::Event
    end
  end
end