# Concrete Component
class BasicModelCar
  def initialize(make,model,miles,colour,image,owners,reg,price,description)
    @make = make
    @model = model
    @miles = miles
    @kms = miles * 1.61
    @colour = colour
    @image = image
    @owners = owners
    @reg = reg
    @price = price
    @description = "Basic Model "+ @make + " " + description + " " + @model + " Reg No:" + @reg + " with   #{@miles} miles (#{@kms}kms)" + " in " + @colour +"," 
  end
  
  def getPrice
    return @price
  end
  
  def getColor
    return @colour
  end
  
  def getMiles
    return "#{@miles}" + " miles (#{@kms}kms)"
  end
  
  def getDescription
    return @description + " Costing (#{@price})"
  end
end

# DecoratorPower Steering
class BasicModelCarDecorator
  def initialize(real_car)
    @real_car = real_car
    @description = "undefined Addon"
  end
  
  def getDescription
    return @description
  end
  
  def getPrice
    return @price
  end
end

# Concrete Decorator
class NCT < BasicModelCarDecorator
  def initialize(real_car)
    super(real_car)
    @description = "NCT'd"
  end
  
  def getDescription
    return @real_car.getDescription + " + " + @description
  end
    
  def getPrice
    return @real_car.getPrice
  end
end

class Taxed < BasicModelCarDecorator
  def initialize(real_car)
    super(real_car)
    @description = "Taxed"
  end

  def getDescription
    return @real_car.getDescription + " + " + @description
  end
   
  def getPrice
    return @real_car.getPrice
  end
end

class ExtendedWarranty < BasicModelCarDecorator
  def initialize(real_car)
    super(real_car)
    @description = "Extended Warranty"
    @extraCost = 500
  end
  
  def getPrice
    return @real_car.getPrice + @extraCost
  end
  
  def getDescription
    return @real_car.getDescription + " + " + @description + "(#{@extraCost})"
  end
end



class Payments < BasicModelCarDecorator
  def initialize (real_car)
    super(real_car)
    @description = "Payments over "
    @threeYrFactor = 31
    @fourYrFactor = 24
    @fiveYrFactor = 20
  end
  
  def get3yrPmts
    return @description + "36 months = " + (@real_car.getPrice/1000)*@threeYrFactor
  end
  
  def get4yrPmts
    return @description + "48 months = " + (@real_car.getPrice/1000)*@fourYrFactor
  end
  
  def get5yrPmts
    return @description + "60 months = " + (@real_car.getPrice/1000)*@fiveYrFactor
  end
end
  


# Create an instance of a Basic car make, model, miles, color, engineSize, price
# make,model,miles,colour,image,owners,reg,price,description
myCar = BasicModelCar.new("VW", "Golf", 27543, "Red","", 2, "09-KE-502",30000, "GTI")
puts myCar.getPrice
puts myCar.getMiles

# Add some additional features to our car
myCar = NCT.new(myCar)
myCar = Taxed.new(myCar)
myCar = ExtendedWarranty.new(myCar)

# Display the cost of the new car with an itemised cost
puts "The Cost of a new car to your specification is #{myCar.getPrice}"
puts myCar.getDescription 





