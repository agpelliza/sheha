class Sheha::Event
  include Comparable

  attr_accessor :name, :description

  def initialize(id)
    @id = id
  end

  def ==(other)
    @id == other.id
  end

  def eql?(other)
    @id.eql? other.id
  end

  def hash
    @id.hash
  end

  def <=>(other)
    @id <=> other.id
  end

  def succ
    self.class.new @id.succ
  end
end