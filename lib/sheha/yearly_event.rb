class Sheha::YearlyEvent < Sheha::Event
  def initialize(month, month_day)
    Sheha::Helper.validate_month(month)
    Sheha::Helper.validate_month_day(month_day)
    super "#{month}#{month_day}".to_i
  end

  def month
    "#{four_digits_id[0..1]}".to_i
  end

  def month=(month)
    Sheha::Helper.validate_month(month)
    @id = "#{month}#{four_digits_id[2..3]}".to_i
  end

  def month_day
    "#{four_digits_id[2..3]}".to_i
  end

  def month_day=(month_day)
    Sheha::Helper.validate_month_day(month_day)
    @id = "#{four_digits_id[0..1]}#{month_day}".to_i
  end

  def event?(date)
    month == date.month && month_day == date.day
  end

  def succ
    self.class.new(succ_month, succ_month_day)
  end

  private
    def four_digits_id
      "%04d" % @id
    end

    def succ_month
      if month_day == 31
        return 1 if month == 12
        return month + 1
      end
      month
    end

    def succ_month_day
      return 1 if month_day == 31
      month_day + 1
    end
end