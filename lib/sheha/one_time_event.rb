class Sheha::OneTimeEvent < Sheha::Event
  attr_alias :date, :id

  def initialize(date)
    super date
  end
end