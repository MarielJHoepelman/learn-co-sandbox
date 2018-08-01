class Customer
  attr_accessor :name, :age
 
  @@all = []
 
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
  def self.all
    @@all
  end
 
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
 
  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end
 
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end
 
  def new_meal_20_percent(waiter, total)
    tip = total * 0.2
    Meal.new(waiter, total, tip)
  end
 
  def self.oldest_customer
    oldest_age = 0
    oldest_customer = nil
    self.all.each do |customer|
      if customer.age > oldest_age
        oldest_age = customer.age
        oldest_customer = customer
      end
    end
    oldest_customer
  end
 
end

class Waiter
  attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end
    
  def waiters
   meals.map do |meal|
    meal.waiter
    end
  end
  
  
  def yrs_experience_average 
    self.yrs_experience.average 
  end 
 
end

class Meal
 
  attr_accessor :waiter, :customer, :total, :tip
 
  @@all = []
 
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
 
  def self.all
    @@all
  end
end

sam = Customer.new("Sam", 27)
pat = Waiter.new("Pat", 22)
alex = Waiter.new("Alex", 35)
sam.new_meal(pat, 50, 10)
sam.new_meal(alex, 20, 3)
pat.new_meal(sam, 30, 5)