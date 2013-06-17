class Sheha::OneTimeEvent < Sheha::Event
  attr_instance_var :date, :id

  def initialize(date)
    super date
  end

  def event?(date)
    self.date == date
  end
end