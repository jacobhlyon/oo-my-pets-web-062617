class Owner
  
	attr_accessor :pets, :name
	attr_reader :species

	@@owners_count = 0
	@@owners = []

	def initialize(name)
		@name = name
		@pets = {fishes: [], cats: [], dogs: []}
		@@owners << self
		@@owners_count += 1
		@species = "human"
	end

	def self.reset_all
		@@owners = []
		@@owners_count = 0
	end


	def self.pets
		@pets
	end

	def self.count
		@@owners_count
	end

	def self.all
		@@owners
	end

	def say_species
		"I am a #{species}."
	end

	def buy_fish(name)
		new_fish = Fish.new(name)
		self.pets[:fishes] << new_fish
		:fishes
	end

	def buy_cat(name)
		new_cat = Cat.new(name)
		self.pets[:cats] << new_cat
		:cats
	end

	def buy_dog(name)
		new_dog = Dog.new(name)
		self.pets[:dogs] << new_dog
		:dogs
	end

	def walk_dogs
		self.pets[:dogs].each do |dog|
			dog.mood = "happy"
		end
	end

	def play_with_cats
		self.pets[:cats].each do |cat|
			cat.mood = "happy"
		end
	end

	def feed_fish
		self.pets[:fishes].each do |fish|
			fish.mood = "happy"
		end
	end

	def list_pets
		number_of_dogs = self.pets[:dogs].length
		number_of_cats = self.pets[:cats].length
		number_of_fish = self.pets[:fishes].length
		"I have #{number_of_fish} fish, #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
	end
	

	def sell_pets
		self.pets[:dogs].each do |dog|
			dog.mood = "nervous"
		end
		self.pets[:cats].each do |cat|
			cat.mood = "nervous"
		end
		self.pets[:fishes].each do |fish|
			fish.mood = "nervous"
		end
		self.pets = {fishes: [], cats: [], dogs: []}
	end


end