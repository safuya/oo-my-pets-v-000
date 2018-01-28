require 'pry'

class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@owners = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@owners << self
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners = []
  end

  def self.count
    @@owners.length
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = 'happy' }
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = 'happy' }
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = 'happy' }
  end

  def sell_pets
    @pets.each do |_, pet_array|
      pet_array.each { |pet| pet.mood = 'nervous' }
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def count(pet)
    @pets[pet].length
  end

  def list_pets
    "I have #{count(:fishes)} fish, #{count(:dogs)} dog(s), and #{count(:cats)} cat(s)."
  end

end
