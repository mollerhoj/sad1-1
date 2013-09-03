class Cupid
  def match men
    man = find_free_man(men)
    if man
      woman = man.pref.shift
      if woman.prefer man
        man.marry woman
      end
      match men
    end
  end

  def find_free_man men
    men.find {|m| m.partner == nil}
  end

  def print_couples(men)
    return print_couple(men.shift)+print_couples(men) if !men.empty?
    ""
  end

  def print_couple(man)
    return man.name + ' -- ' + man.partner.name + "\n" if man
    ""
  end
end

class Human
  attr_accessor :name
  attr_accessor :pref
  attr_accessor :partner

  def initialize name=nil,pref=[],partner=nil
    @name = name
    @pref = pref
    @partner = partner
  end
  
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

  def to_s
    @name
  end

  def ==(human)
    if human
      self.name == human.name
    end
  end
end
