require 'singleton'

class CrashLogger
  include Singleton
  
  def initialize
    @log = File.open("crashLog.txt", "a+")
  end
  
  def logCrash(reg)
    @log.puts(reg)
    @log.flush
  end
  
end

#out = CrashLogger.instance
#out.logCrash("132-KE-345")
