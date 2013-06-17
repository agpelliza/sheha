class Sheha::MonthlyEvent < Sheha::Event
  attr_alias :month_day, :id

  def initialize(month_day)
    raise "There is no #{month_day} day in a month." unless valid_month_day? month_day
    super month_day
  end

  def succ
    self.class.new succ_month_day
  end

  private
    def valid_month_day?(month_day)
      month_day >= 1 && month_day <= 31
    end

    def succ_month_day
      return 1 if month_day == 31
      month_day +1
    end
end