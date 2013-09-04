class Cupid
  def initialize
    @i = 0
    @tA = 0
    @tB = 0
  end

  # Used to be beautiful recursion. But many Ruby implementations
  # (including mine) does not have tail call optimization
  def match men
    while(true)
      @i += 1
      @t1 = Time.now
      man = find_free_man(men)
      @t2 = Time.now
      @tA += @t2 - @t1
      if man
        woman = man.pref.shift
        if woman.prefer man
          @t1 = Time.now
          man.marry woman
          @t2 = Time.now
          @tB += @t2 - @t1
        end
      else
        break
      end
      puts @tB - @tA
    end
  end

  def print_couples(men)
    return print_couple(men.shift)+print_couples(men) if !men.empty?
    ""
  end

  def print_couple(man)
    return man.name + ' -- ' + man.partner.name + "\n" if man
    ""
  end

  private
  def find_free_man men
    men.find {|m| m.partner == nil}
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
