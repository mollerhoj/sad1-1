def compute(men,women)
  txt = ''
  men.each do |m|
    txt += m.name + ' -- ' + m.pref.first.name + "\n"
  end
  txt
end

class Human
  attr_reader :name
  attr_reader :pref

  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end
