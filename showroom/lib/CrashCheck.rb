class CheckCrashCar
  attr_accessor :reg
  def initialize(theReg)
    @theReg = theReg
    $txtinput = ""
 
    #Read text file & input into array
    def outputResult()
      #@theReg = theWord
      File.open("crashLog.txt", 'r') do |f1|
        while line = f1.gets
          $txtinput = line.to_s.chomp
          if @theReg == $txtinput
            $response = "The vehicle Reg.No:  #{@theReg} has been crashed"
            break
          else
            $response = "The vehicle Reg.No:  #{@theReg} has  not been crashed"
          end
        end
      end
        return $response
      end
  end 
end
#puts "please enter the reg of the car to be checked"

#reg = gets().to_s.chomp

#C1 = CheckCrashCar.new(reg)
#C1.outPutArray
#ans = C1.outputResult()
#puts ans