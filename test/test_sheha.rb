require 'test/unit'
require 'sheha'

class ShehaTest < Test::Unit::TestCase
  
  # def test_sheha_describe
  #   sheha = Sheha.new
  #   sheha.describe do
  #     weekly do
  #       on "wednesday" do
  #         name         "Some Name"
  #         description  "Some description"
  #       end

  #       from_to "saturday", "sunday" do
  #         name         "Some Other Name"
  #         description  "Some other description"
  #       end
  #     end

  #     monthly do
  #       on 1 do
  #         name         "Some Name"
  #         description  "Some description"
  #       end

  #       from_to 25, 31 do
  #         name         "Some Other Name"
  #         description  "Some other description"
  #       end
  #     end

  #     yearly do
  #       from_to [1, 1], [1, 7] do
  #         name         "Some Name"
  #         description  "Some description"
  #       end

  #       on 12, 25 do
  #         name         "Some Other Name"
  #         description  "Some other description"
  #       end
  #     end

  #     one_time do
  #       on Date.new(2013, 11, 20) do
  #         name         "Some Name"
  #         description  "Some description"
  #       end

  #       from_to Date.new(2013, 12, 1), Date.new(2013, 12, 5) do
  #         name         "Some Other Name"
  #         description  "Some other description"
  #       end
  #     end
  #   end

  #   assert sheha.event? Date.new(2012, 12, 25) # Validating against a know configured event
  # end

  # def test_sheha_load
  #   sheha = Sheha.new
  #   sheha.load("sheha.yml")
  #   assert sheha.event? Date.new(2012, 12, 25) # Validating against a know configured event
  # end

  # def test_sheha_config
  #   sheha = Sheha.new
  #   sheha_hash = YAML::load(File.read('sheha.yml'))
  #   sheha.config(sheha_hash)
  #   assert sheha.event? Date.new(2012, 12, 25) # Validating against a know configured event
  # end

  # def test_sheha_events
  #   sheha = Sheha.new
  #   sheha.add_one_time_event(Date.new(2012, 12, 25)).with_name("Some Name").with_description("Some description")
  #   sheha_hash = sheha.events(Date.new(2012, 12, 25))
  #   assert sheha_hash.is_a? Hash
  #   assert_equal(Date.new(2012, 12, 25), sheha_hash['date'])
  #   assert_equal("Some Name", sheha_hash['name'])
  #   assert_equal("Some description", sheha_hash['description'])
  # end

  def test_add_event
    sheha = Sheha.new
    sheha.add(Sheha::OneTimeEvent.new(Date.new(2012, 12, 25)))
    assert(sheha.instance_variable_get('@events').include?(Sheha::OneTimeEvent.new(Date.new(2012, 12, 25))))
  end

  def test_is_event
    sheha = Sheha.new
    sheha.add(Sheha::OneTimeEvent.new(Date.new(2012, 12, 25)))
    assert sheha.event? Date.new(2012, 12, 25)
  end

  def test_add_one_time_event
    sheha = Sheha.new
    sheha.add_one_time_event(Date.new(2012, 12, 25))
    assert sheha.event? Date.new(2012, 12, 25)
  end

  def test_add_yearly_event
    sheha = Sheha.new
    sheha.add_yearly_event 12, 25
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_monthly_event
    sheha = Sheha.new
    sheha.add_monthly_event 25
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_weekly_event
    sheha = Sheha.new
    sheha.add_weekly_event 'wednesday'
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_event_range_one_time_dates
    sheha = Sheha.new
    sheha.add_one_time_event_range Date.new(2013, 12, 20), Date.new(2013, 12, 30)
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_yearly_event_range
    sheha = Sheha.new
    sheha.add_yearly_event_range [12, 20], [12, 30]
    assert sheha.event? Date.new(2013, 12, 25)
  end

  def test_add_monthly_event_range
    sheha = Sheha.new
    sheha.add_monthly_event_range 20, 30
    assert sheha.event? Date.new(2013, 12, 25)
  end
end