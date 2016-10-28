require 'pry'

def money_start()
	puts "\nHow much money do you have to spend?"
	@my_money = gets.to_f
	@current_total = 0.0
	@total_calories = 0
	puts "\nGreat! You have $#{@my_money}0 to spend."
	main_dish()
end

def main_dish()
	@current_total = 0.0
	@current_order = []
	@total_calories = 0
	puts "\n~~~ Welcome to Ruby Cafe ~~~"
	puts "Select a main dish:"
	puts "1.) #{@hamburger.name} (#{@hamburger.calories} cals) $#{@hamburger.cost}0"
	puts "2.) #{@pizza.name} (#{@pizza.calories} cals) $#{@pizza.cost}0"
	puts "3.) #{@meatloaf.name} (#{@meatloaf.calories} cals) $#{@meatloaf.cost}0"
	puts "4.) #{@nachos.name} (#{@nachos.calories} cals) $#{@nachos.cost}0"
	puts "Type QUIT to exit."
	puts "Your money: $#{@my_money}0 -- Current order total: $#{@current_total}0"
	print "\nWhat is your selection? "
	case gets.strip.downcase
	when "1"
		if @current_total + @hamburger.cost <= @my_money
			@current_order << @hamburger
			@current_total += @hamburger.cost
		else
			puts "\nYou don't have enough money for that item."
		end
	when "2"
		if @current_total + @pizza.cost <= @my_money
			@current_order << @pizza
			@current_total += @pizza.cost
		else
			puts "\nYou don't have enough money for that item."
		end
	when "3"
		if @current_total + @meatloaf.cost <= @my_money
			@current_order << @meatloaf
			@current_total += @meatloaf.cost
		else
			puts "\nYou don't have enough money for that item."
		end
	when "4"
		if @current_total + @nachos.cost <= @my_money
			@current_order << @nachos
			@current_total += @nachos.cost
		else
			puts "\nYou don't have enough money for that item."
		end
	when "quit"
		exit(0)
	else
		puts "\nInvalid choice, select a menu item by number.\n\n"
		main_dish()
	end
	another_main()
end

def another_main()
	puts "\nYour money: $#{@my_money}0 -- Current order total: $#{@current_total}0"
	puts "Do you want another main dish? [y]es or [n]o"
	case gets.strip.downcase
	when "y", "yes"
		main_dish()
	when "n", "no"
		side_dish()
	else
		another_main()
	end
end

def side_dish()
	puts "\nSelect a side dish:"
	puts "1.) #{@salad.name} (#{@salad.calories} cals) $#{@salad.cost}0"
	puts "2.) #{@mac_n_cheese.name} (#{@mac_n_cheese.calories} cals) $#{@mac_n_cheese.cost}0"
	puts "Your money: $#{@my_money}0 -- Current order total: $#{@current_total}0"
	print "\nWhat is your selection? "
	case gets.strip
	when "1"
		if @current_total + @salad.cost <= @my_money
			@current_order << @salad
			@current_total += @salad.cost
		else
			puts "\nYou don't have enough money for that item."
		end
	when "2"
		if @current_total + @mac_n_cheese.cost <= @my_money
			@current_order << @mac_n_cheese
			@current_total += @mac_n_cheese.cost
		else
			puts "\nYou don't have enough money for that item."
		end
	else
		puts "\nInvalid choice, select a menu item by number.\n\n"
		side_dish()
	end
	another_side()
end

def another_side()
	puts "\nYour money: $#{@my_money}0 -- Current order total: $#{@current_total}0"
	puts "Do you want another side dish? [y]es or [n]o"
	case gets.strip.downcase
	when "y", "yes"
		side_dish()
	when "n", "no"
		complete_order()
	else
		another_side()
	end
end

def complete_order()
	puts "\nYou ordered:"
	@current_order.each do |item|
		puts "$#{item.cost}0 #{item.name}"
		@total_calories += item.calories
	end
	puts "----------"
	puts "TOTAL: $#{@current_total}0, Calories: #{@total_calories}"
	puts "\nDo you want to complete this transaction? [y]es to pay, [n]o to clear order and start over"
	case gets.strip.downcase
	when "y", "yes"
		puts "Thank you, enjoy your food!"
		@my_money -= @current_total
		puts "You have $#{@my_money}0 remaining."
		main_dish()
	when "n", "no"
		main_dish()
	end
end

class Food
	attr_accessor :name, :cost, :calories
	def initialize(name, cost, calories)
		@name = name
		@cost = cost
		@calories = calories
	end
end

@current_order = []

# main dishes
@hamburger = Food.new("Hamburger", 5.00, 1200)
@pizza = Food.new("Pizza", 4.00, 1000)
@meatloaf = Food.new("Meatloaf", 3.00, 850)
@nachos = Food.new("Nachos Supreme", 6.00, 2100)

# side dishes
@salad = Food.new("Caesar Salad", 2.00, 300)
@mac_n_cheese = Food.new("Mac N Cheese", 2.50, 550)

# desserts
@cheesecake = Food.new("Cheesecake", 4.25, 600)
@brownie = Food.new("Brownie", 1.50, 350)



while true
	money_start()
end