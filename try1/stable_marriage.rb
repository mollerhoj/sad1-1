def compute(men,women)

  men.each do |m|
    woman = m.pref.first

    m.partner = woman
  end

  print_couples men
end

def print_couples(men)
  txt = ""
  men.each do |m|
    txt += print_couple m
  end
  txt
end

def print_couple(man)
  man.name + ' -- ' + man.partner.name + "\n"
end

class Human
  attr_accessor :name
  attr_accessor :partner
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
