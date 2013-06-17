class Calendar::WeeklyHolidays < Calendar::Holidays
  
  def add(week_day)
    add_holiday WeeklyHoliday.new(week_day)
  end

  def add_range(from, to)
    process_range(WeeklyHoliday.new(from), WeeklyHoliday.new(to))
  end

  def holiday?(date)
    include? WeeklyHoliday.parse(date)
  end

  class WeeklyHoliday < Holiday

    def self.parse(date)
      new "#{date.strftime('%A').downcase}".to_sym
    end
  end
end