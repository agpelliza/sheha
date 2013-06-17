require 'date'
require 'set'

class Sheha

  def initialize
    @events = Set.new
  end

  def add(event)
    @events.add event
  end

  def add_range(from, to)
    raise "Invalid Range" if not valid_range?(from, to)

    (from..to).each do |date|
      if block_given?
        add yield(date) 
      else
        add date
      end
    end
  end

  def event?(date)
    @events.each do |event|
      return true if event.event? date
    end
    return false
  end

  # Add Events

  def add_weekly_event(week_day)
    add WeeklyEvent.new(week_day)
  end

  def add_monthly_event(month_day)
    add MonthlyEvent.new(month_day)
  end

  def add_yearly_event(month, month_day)
    add YearlyEvent.new(month, month_day)
  end

  def add_one_time_event(date)
    add OneTimeEvent.new(date)
  end

  # Add Ranges

  def add_weekly_event_range(from, to)
    add_range WeeklyEvent.new(from), WeeklyEvent.new(to)
  end

  def add_monthly_event_range(from, to)
    add_range MonthlyEvent.new(from), MonthlyEvent.new(to)
  end

  def add_yearly_event_range(from, to)
    add_range YearlyEvent.new(from[0], from[1]), YearlyEvent.new(to[0], to[1])
  end

  def add_one_time_event_range(from, to)
    add_range OneTimeEvent.new(from), OneTimeEvent.new(to)
  end

  private
    def valid_range?(from, to)
      from < to
    end
end

require 'sheha/errors'
require 'sheha/helper'
require 'sheha/event'
require 'sheha/weekly_event'
require 'sheha/monthly_event'
require 'sheha/yearly_event'
require 'sheha/one_time_event'