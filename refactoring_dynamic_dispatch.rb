# Refactoring using dynamic dispatch (i.e. using define_method)

class DS
  def initialize # connect to data source...
  end
  
  def get_mouse_info(workstation_id) # ...
    "Dual Optical"
  end
  
  def get_mouse_price(workstation_id) # ...
    40
  end
  
  def get_keyboard_info(workstation_id) # ...
    "Standard UK"
  end
  
  def get_keyboard_price(workstation_id) # ...
    20
  end

  def get_cpu_info(workstation_id) # ...
    "2.16 Ghz"
  end

  def get_cpu_price(workstation_id) # ...
    220
  end

  def get_display_info(workstation_id) # ...
    "LED 1280x1024"
  end

  def get_display_price(workstation_id) # ...
  # ...and so on
    150
  end
end

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) {  Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method(name) {
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.to_s.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    }
  end
end

datasource = DS.new
mycomputer = Computer.new(101, datasource)
puts mycomputer.mouse
