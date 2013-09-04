class Cupid
  def initialize
    @i = 0
    @tA = 0
    @tB = 0
    @free_men = []
  end

  # Used to be beautiful recursion. But many Ruby implementations
  # (including mine) does not have tail call optimization
  def match men
    @free_men = men.dup
    while(true)
      man = @free_men.first 
      if man
        woman = man.pref.shift
        k = woman.prefer man
        if woman.prefer man
          if woman.partner
            @free_men << woman.partner
          end
          man.marry woman
          @free_men.shift
        end
      else
        break
      end
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
    if p.pref.kind_of?(Array)
      if @partner and @pref.index(p) and @pref.index(@partner)
        @pref.index(p) < @pref.index(@partner)
      else
        true
      end
    elsif p.pref.kind_of?(Hash)
      if @partner and @pref[p] and @pref[@partner]
        @pref[p].to_i < @pref[@partner].to_i
      else
        true
      end
    elsif
      throw 'No such type:' + p.kindof
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
