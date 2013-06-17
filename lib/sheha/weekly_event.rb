class Sheha::WeeklyEvent < Sheha::Event
  WEEK_DAYS = Date.const_get(:DAYNAMES).map {|week_day| week_day.downcase.to_sym}
  attr_alias :week_day, :id

  def initialize(week_day)
    raise "There is no #{week_day} in a week." unless valid_week_day? week_day
    super week_day
  end

  def succ
    self.class.new succ_week_day
  end

  private
    def valid_week_day?(week_day)
      WEEK_DAYS.member? week_day
    end

    def succ_week_day
      return WEEK_DAYS[0] if WEEK_DAYS.find_index(week_day) == 6
      WEEK_DAYS[WEEK_DAYS.find_index(week_day) +1]
    end
end