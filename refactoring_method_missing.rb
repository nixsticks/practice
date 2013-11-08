# Refactoring the code using "Ghost" methods, i.e. by redefining method_missing.

class DS
  def initialize # connect to data source...
  end
  
  def get_mouse_info(workstation_id) # ...
    if workstation_id == 101
      "Dual Optical"
    else
      "It did not pass along the id"
    end
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
  end

  def method_missing(name, *args)
    super if !@data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", args[0])
    price = @data_source.send("get_#{name}_price", args[0])
    result = "#{name.to_s.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end

datasource = DS.new
mycomputer = Computer.new(101, datasource)
puts mycomputer.mouse
puts mycomputer.respond_to?(:mouse)