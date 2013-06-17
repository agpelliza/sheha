require 'date'
require 'set'

class Module
  def attr_alias(new_attr, original)
    alias_method(new_attr, original) if method_defined? original
    new_writer = "#{new_attr}="
    original_writer = "#{original}="
    alias_method(new_writer, original_writer) if method_defined? original_writer
  end
end

class Sheha

  def initialize
    @events = Set.new
  end

  def event?(date)
    @events.include? date
  end

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

  # Ranges

  def add_monthly_event_range(from, to)
    add_range MonthlyEvent.new(from), MonthlyEvent.new(to)
  end

  def add_yearly_event_range(from, to)
    add_range YearlyEvent.new(from[0], from[1]), YearlyEvent.new(to[0], to[1])
  end

  def add_one_time_event_range(from, to)
    add_range OneTimeEvent.parse(from), OneTimeEvent.parse(to)
  end

  private
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

    def valid_range?(from, to)
      from < to
    end
end