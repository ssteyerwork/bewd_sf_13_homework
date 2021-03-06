require 'pry'
require 'pry-byebug'

class Thermostat

  #creates getter && setter methods for each attribute
  attr_accessor :current_temp
  attr_reader :target

#instance_factory to support creating a new thermostat using Thermostat.new
  def initialize(current_temp, target)
    @current_temp = current_temp
    @target = target
  end

 #self.target , @target and target are all the same inside of this instance method
  def calibrate_temp
    #use a conditional to calibrate the temperature
    if @current_temp > @target #this the same as #@degrees
      puts "It's #{@current_temp}That's too hot! Turn on the air conditioner"
    elsif @current_temp < @target
      puts "Brr!!! It's #{@current_temp}. It's too cold. Turn on the heat"
    else
      puts "ahhh! Just right"
    end
  end

  def self.detect_temperature(all_temps, target_temp)
    #loop through all temps, detect the temperature, then calibrate it
    all_temps.each do |tmp|
      tmp = Thermostat.new(tmp, target_temp)
      tmp.calibrate_temp
    end
  end
end

#The temperature is being read externally somewhere, so let's just create an array of those readings
#and pass them into our class method Thermostat.detect_temperature(all_temps, target_temp)

#array_to_temperatures
all_temps = [45,65,85,95, 66, 99, 75, 12, 22, 45, 65, 75, 70, 100, 10, 52, 22]
#set by user
target_temp = 75

Thermostat.detect_temperature(all_temps, target_temp)
