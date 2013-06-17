class Calendar::OneTimeHolidays < Calendar::Holidays

  def add(*date)
    add_holiday OneTimeHoliday.parse(*date)
  end

  def add_range(from, to)
    process_range(OneTimeHoliday.parse(*from), OneTimeHoliday.parse(*to))
  end

  def holiday?(date)
    include? OneTimeHoliday.new(date)
  end

  class OneTimeHoliday < Holiday

    def self.parse(*date)
      _date = date[0]
      _date = Date.new(*date) if date.size > 1
      new Date.parse(_date.to_s)
    end
  end
end