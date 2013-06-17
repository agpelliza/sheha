class Sheha::MonthlyEvent < Sheha::Event
  attr_instance_var :month_day, :id

  def initialize(month_day)
    Sheha::Helper.validate_month_day(month_day)
    super month_day
  end

  def event?(date)
    month_day == date.day
  end

  def succ
    self.class.new succ_month_day
  end

  private
    def succ_month_day
      return 1 if month_day == 31
      month_day + 1
    end
end