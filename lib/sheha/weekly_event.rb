class Sheha::WeeklyEvent < Sheha::Event
  attr_instance_var :week_day, :id

  def initialize(week_day)
    Sheha::Helper.validate_week_day(week_day)
    super week_day
  end

  def event?(date)
    week_day == "#{date.strftime('%A').downcase}"
  end

  def <=>(other)
    Sheha::Helper.find_week_day_index(week_day) <=> Sheha::Helper.find_week_day_index(other.week_day)
  end

  def succ
    self.class.new succ_week_day
  end

  private
    def succ_week_day
      return Sheha::Helper.week_day_at(1) if Sheha::Helper.find_week_day_index(week_day) == 7
      Sheha::Helper.week_day_at(Sheha::Helper.find_week_day_index(week_day) + 1)
    end
end