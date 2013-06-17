require 'test/unit'
require 'calendar'

class CalendarTest < Test::Unit::TestCase
  
  def test_add_holiday_one_time_with_date
    calendar = Calendar.new
    calendar.add_holiday Date.new(2013, 12, 25)
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_holiday_one_time_with_string
    calendar = Calendar.new
    calendar.add_holiday '2013-12-25'
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_holiday_one_time_with_args
    calendar = Calendar.new
    calendar.add_holiday 2013, 12, 25
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_yearly_holiday
    calendar = Calendar.new
    calendar.add_yearly_holiday 12, 25
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_monthly_holiday
    calendar = Calendar.new
    calendar.add_monthly_holiday 25
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_weekly_holiday
    calendar = Calendar.new
    calendar.add_weekly_holiday :wednesday
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_holiday_range_one_time_dates
    calendar = Calendar.new
    calendar.add_holiday_range Date.new(2013, 12, 20), Date.new(2013, 12, 30)
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_holiday_range_one_time_strings
    calendar = Calendar.new
    calendar.add_holiday_range '2013-12-20', '2013-12-30'
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_holiday_range_one_time_args
    calendar = Calendar.new
    calendar.add_holiday_range [2013, 12, 20], [2013, 12, 30]
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_yearly_holiday_range
    calendar = Calendar.new
    calendar.add_yearly_holiday_range [12, 20], [12, 30]
    assert calendar.holiday? Date.new(2013, 12, 25)
  end

  def test_add_monthly_holiday_range
    calendar = Calendar.new
    calendar.add_monthly_holiday_range 20, 30
    assert calendar.holiday? Date.new(2013, 12, 25)
  end
end