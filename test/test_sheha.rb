require 'test/unit'
require 'sheha'

class ShehaTest < Test::Unit::TestCase
  
  def test_add_event
    sheha = Sheha.new
    sheha.add(Sheha::OneTimeEvent.new(Date.new(2012, 12, 25)))
    assert(sheha.instance_variable_get('@events').include?(Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))))
  end

  def test_is_event
    sheha = Sheha.new
    sheha.add(Sheha::OneTimeEvent.new(Date.new(2012, 12, 25)))
    assert sheha.event? Date.new(2012, 12, 25)
  end

  def test_add_one_time_event
    sheha = Sheha.new
    sheha.add_one_time_event(Date.new(2012, 12, 25))
    assert sheha.event? Date.new(2012, 12, 25)
  end

  def test_add_yearly_event
    sheha = Sheha.new
    sheha.add_yearly_event 12, 25
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_monthly_event
    sheha = Sheha.new
    sheha.add_monthly_event 25
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_weekly_event
    sheha = Sheha.new
    sheha.add_weekly_event 'wednesday'
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_event_range_one_time_dates
    sheha = Sheha.new
    sheha.add_one_time_event_range Date.new(2013, 12, 20), Date.new(2013, 12, 30)
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_yearly_event_range
    sheha = Sheha.new
    sheha.add_yearly_event_range [12, 20], [12, 30]
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_monthly_event_range
    sheha = Sheha.new
    sheha.add_monthly_event_range 20, 30
    assert sheha.event? Date.new(2013, 12, 25)
  end
end