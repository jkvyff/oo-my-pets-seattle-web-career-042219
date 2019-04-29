require 'pry'
class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []
  @@count = 0

  def initialize(species)
  	@species = species
  	@pets = {fishes: [], dogs: [], cats: []}
  	@@all << self
  end

  def say_species
  	"I am a #{@species}."
  end

  def buy_fish(name)
  	fish = Fish.new(name)
  	pets[:fishes] << fish
  end

  def buy_cat(name)
  	cat = Cat.new(name)
  	pets[:cats] << cat
  end

  def buy_dog(name)
  	dog = Dog.new(name)
  	pets[:dogs] << dog
  end

  def walk_dogs
  	pets[:dogs].each do |dog|
  		dog.mood = "happy"
  	end
  end

  def play_with_cats
  	pets[:cats].each do |cat|
  		cat.mood = "happy"
  	end
  end

  def feed_fish
  	pets[:fishes].each do |fish|
  		fish.mood = "happy"
  	end
  end

  def sell_pets
  	pets.each do |species|
  		species[1].each do |pet|
  			pet.mood = "nervous"
  		end
  	end
  	pets.clear
  end

  def list_pets
  	message = "I have"
  	pets.each do |type|
  		pet_count = 0
  		type[1].each do |pet|
  			pet_count += 1
  		end
  		case type[0]
  			when :fishes
  				message = "#{message} #{pet_count} fish,"
  			when :dogs
  				message = "#{message} #{pet_count} dog(s),"
  			when :cats 
  				message = "#{message} and #{pet_count} cat(s)."
  		end
  	end
  	message
  end

  def self.all
  	@@all
  end

  def self.count
  	self.all.length
  end

  def self.reset_all
  	self.all.clear
  end
end