class Module
  def attr_alias(new_attr, original)
    alias_method(new_attr, original) if method_defined? original
    new_writer = "#{new_attr}="
    original_writer = "#{original}="
    alias_method(new_writer, original_writer) if method_defined? original_writer
  end

  def attr_instance_var(attr_name, instance_var)
    # Define a setter for @var
    send :define_method, attr_name do |data|
      instance_variable_set("@#{instance_var}", data)
    end
    # Define a getter for @var
    send :define_method, attr_name do
      instance_variable_get("@#{instance_var}")
    end
  end
end

class Sheha::Helper
  WEEK_DAYS = Date.const_get(:DAYNAMES).map {|week_day| week_day.downcase}

  def self.validate_month(month)
    raise Sheha::InvalidMonthError, "There is no #{month} month." unless valid_month? month
  end

  def self.validate_month_day(month_day)
    raise Sheha::InvalidMonthDayError, "There is no #{month_day} day in a month." unless valid_month_day? month_day
  end

  def self.validate_week_day(week_day)
    raise Sheha::InvalidWeekDayError, "There is no #{week_day} in a week." unless valid_week_day? week_day
  end

  def self.valid_month?(month)
    month >= 1 && month <= 12
  end

  def self.valid_month_day?(month_day)
    month_day >= 1 && month_day <= 31
  end

  def self.valid_week_day?(week_day)
    WEEK_DAYS.member? week_day
  end

  def self.week_day_at(index)
    WEEK_DAYS[index - 1]
  end

  def self.find_week_day_index(week_day)
    WEEK_DAYS.find_index(week_day) + 1
  end
end