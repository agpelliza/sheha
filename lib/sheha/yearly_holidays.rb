class Calendar::YearlyHolidays < Calendar::Holidays

  def add(month, day)
    add_holiday YearlyHoliday.parse_month_day(month, day)
  end

  def add_range(from, to)
    _from = "#{from[0]}#{from[1]}".to_i
    _to = "#{to[0]}#{to[1]}".to_i
    process_range(YearlyHoliday.new(_from), YearlyHoliday.new(_to)) do |yearly_holiday|
      str_date = ("%04d" % yearly_holiday.date_type)
      YearlyHoliday.parse_month_day(str_date[0..1].to_i, str_date[2..3].to_i)
    end
  end

  def holiday?(date)
    include? YearlyHoliday.parse(date)
  end

  class YearlyHoliday < Holiday

    def self.parse(date)
      parse_month_day(date.month, date.day)
    end

    def self.parse_month_day(month, day)
      new "#{month}-#{day}".to_i
    end
  end
end