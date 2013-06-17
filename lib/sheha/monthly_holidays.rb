class Calendar::MonthlyHolidays < Calendar::Holidays

  def add(day)
    add_holiday MonthlyHoliday.new(day)
  end

  def add_range(from, to)
    process_range(MonthlyHoliday.new(from), MonthlyHoliday.new(to))
  end

  def holiday?(date)
    include? MonthlyHoliday.parse(date)
  end

  class MonthlyHoliday < Holiday

    def self.parse(date)
      new date.day
    end
  end
end