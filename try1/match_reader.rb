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

    # Read the n= line
    line = read_line file
    @amount = take_integer line

    #Read the names:
    if @amount
      for i in 0...(@amount*2)
        line = read_line file
        name = line[/[A-z]+/]
        @men << name
        name = line[/[A-z]+/]
        @women << name
      end
    end
    file.close
  end

  def take_integer line
     if line
       line[/\d+/].to_i
     end
  end

  def read_line file
    line = file.gets
    if line
      while(line.match(/^#/))
        line = file.gets
      end
    end
    line
  end
end
