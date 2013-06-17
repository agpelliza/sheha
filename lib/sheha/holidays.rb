class Calendar::Holidays

  def initialize
    @holidays = Set.new
  end

  def include?(date)
    @holidays.include?(date)
  end

  def add_holiday(date)
    @holidays.add(date)
  end

  def process_range(from, to)
    raise "Invalid Range" if not valid_range?(from, to)

    (from..to).each do |date|
      if block_given?
        add_holiday yield(date) 
      else
        add_holiday date
      end
    end
  end

  def valid_range?(from, to)
    from < to
  end

  class Holiday

    include Comparable
    
    attr_accessor :date_type

    def initialize(date_type)
      @date_type = date_type
    end

    def ==(other)
      @date_type == other.date_type
    end

    def eql?(other)
      @date_type.eql? other.date_type
    end

    def hash
      @date_type.hash
    end

    def <=>(other)
      @date_type <=> other.date_type
    end

    def succ
      self.class.new @date_type.succ
    end
  end
end