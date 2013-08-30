def compute(men,women)
  couples = [] 

  men.each do |m|
    woman = m.pref.first

    couples << Couple.new(man:m,woman:woman) 
  end

  print_couples couples
end

def print_couples(couples)
  txt = ""
  couples.each do |c|
    txt += c.to_s + "\n"
  end
  txt
end

class Couple
  attr_accessor :man
  attr_accessor :woman

  def to_s
    @man.name + ' -- ' + @woman.name
  end

  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end

class Human
  attr_accessor :name
  attr_accessor :pref

  def prefer a, b
    @pref.index(a) < @pref.index(b)
  end

  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end
