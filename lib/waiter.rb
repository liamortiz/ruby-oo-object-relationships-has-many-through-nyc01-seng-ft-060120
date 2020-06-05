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
  
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
  
   def meals
    Meal.all.select{|meal| meal.waiter == self}
  end
  
  def best_tipper
    prev_tip = 0
    customer = nil
    meals.each do |meal|
      if prev_tip < meal.tip
        prev_tip = meal.tip
        customer = meal.customer
      end
    end
    customer
  end
end