class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat
  end

  def speak
  end

  def sleep
  end
end

class Duck < Animal
  def eat
    puts "#{self.class.name} #{name} is eating"
  end

  def speak
    puts "#{self.class.name} #{name} is speaking"
  end

  def sleep
    puts "#{self.class.name} #{name} is sleeping"
  end
end

class Frog < Animal
  def eat
    puts "#{self.class.name} #{name} is eating"
  end

  def speak
    puts "#{self.class.name} #{name} is speaking"
  end

  def sleep
    puts "#{self.class.name} #{name} is sleeping"
  end
end

class Plant
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def grow
  end
end

class Algae < Plant
  def grow
    puts "The Algae #{name} soaks up the sun and grows."
  end
end

class WaterLily < Plant
  def grow
    puts "The water lily #{name} floats, soaks up the sun ang grows."
  end
end

class Pond
  def initialize(number_animals: 0, number_plants: 0)
    @animals = []
    number_animals.times do |i|
      animal = new_organism(:animal, "Animal#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_organism(:plant, "Plant#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each { |plant| plant.grow }
    @animals.each { |animal| animal.speak }
    @animals.each { |animal| animal.eat }
    @animals.each { |animal| animal.sleep }
  end
end

class DuckWaterLilyPond < Pond
  def new_organism(type, name)
    if type == :animal
      Duck.new(name)
    elsif type == :plant
      WaterLily.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end

class FrogAlgaePond < Pond
  def new_organism(type, name)
    if type == :animal
      Frog.new(name)
    elsif type == :plant
      Algae.new(name)
    else
      raise "Unkown organism type: #{type}"
    end
  end
end

# DuckWaterLilyPond.new(number_animals: 4, number_plants: 2)
# FrogAlgaePond.new(number_animals: 3, number_plants: 7)
