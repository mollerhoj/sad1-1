class MatchReader
  attr_accessor :amount
  attr_accessor :men
  attr_accessor :women

  def initialize
    @men = []
    @women = []
  end

  def read path
    file = File.new(path)
    file.each_line do |line|
      parse line
    end
    file.close
  end

  private
  def parse line
    case line
    when /^n=(\d)+/
      @amount = $1.to_i
    when /^(\d)+\s+(\S+)/
      feed_humen $1, $2
    when /^\d+:\s+\d+/
      feed_pref line.scan(/(\d+)/).map {|m| m.first.to_i}
    end
  end

  def feed_humen number,name
    if number.to_i.odd?
      @men << Human.new(name)
    else
      @women << Human.new(name)
    end
  end

  def feed_pref data
    first = data.shift
    data.each do |d|
      if first.odd?
        @men[(first-1)/2].pref << @women[d/2-1]
      else
        @women[first/2-1].pref << @men[(d-1)/2]
      end
    end
  end
end
