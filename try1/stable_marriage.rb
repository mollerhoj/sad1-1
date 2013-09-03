def compute(men)
  match(men)
  print_couples men
end

def match(men)
  free_men = select_free_men(men)
  while(!free_men.empty?)
    man = free_men.first
    woman = man.pref.shift
    if woman.prefer man
      man.marry woman
    end
    free_men = select_free_men(men)
  end
end

def select_free_men men
  men.select {|m| m.partner == nil}
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
  attr_accessor :pref
  attr_accessor :partner

  def marry p
    #break up with old partner
    if @partner then @partner.partner = nil end
    #new parter break
    if p.partner then p.partner.partner = nil end
    @partner = p
    p.partner = self
  end

  def prefer p
    if @partner and @pref.index(p) and @pref.index(@partner)
      @pref.index(p) < @pref.index(@partner)
    else
      true
    end
  end

  def initialize name=nil,pref=[],partner=nil
    @name = name
    @pref = pref
    @partner = partner
  end
  
  def to_s
    @name
  end
end
