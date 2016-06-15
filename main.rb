require_relative 'train'
require_relative 'route'
require_relative 'railwaystation'
require_relative 'cargotrain'
require_relative 'passangertrain'
require_relative 'passangercar'
require_relative 'cargocar'
require_relative 'car'
train = Train.new(11, 3)
route = Route.new('First Station','Last Station')
rail = RailwayStation.new('Second Station')
passanger_train = PassangerTrain.new(1, 3)
cargo_train = CargoTrain.new(2, 5)


puts "What would you like to do?"
puts "-- Type 'add station' to add a station."
puts "-- Type 'add train' to add a train."
puts "-- Type 'add car' to add a car."
puts "-- Type 'deduct railway carriage' to deduct a railway carriage."
puts "-- Type 'train on station' to add a train on the station."
puts "-- Type 'stationlist' to display all stations."
puts "-- Type 'trainlist' to display all trains."
puts "-- Type 'exit' to exit."
end_program = false
while(!end_program)
choice = gets.chomp.downcase
case choice
when 'add station'
	puts "Введите название станции:"
	station = gets.chomp
	rail = RailwayStation.new(station)
	route.add_station(rail)
when 'add train'
 	puts "Введите номер поезда:"
	number = gets.chomp
	puts "Введите тип поезда ('PassangerTrain' / 'CargoTrain' == p / c):"
	type = gets.chomp
	puts "Введите количество вагонов в поезде:"
	amount = gets.chomp.to_i
	if type == 'p'
		amount_passanger_car = amount
		passanger_train = PassangerTrain.new(number, amount)
		passanger_train.add_train(passanger_train)
	elsif type == 'c'
		amount_cargo_car = amount
		cargo_train = CargoTrain.new(number, amount)
		cargo_train.add_train(cargo_train)
	else
		puts "Unknown type"
	end
when 'add car'
	if train.instance_of? CargoTrain
		cargo_train.add_car(CargoCar.new)
	elsif train.instance_of? PassangerTrain
		passanger_train.add_car(PassangerCar.new)
	else
		puts "Type's error!"
	end	    	
when 'deduct car'
	@amount_railway_carriage -= 1
when 'train on station'
	if type == 'p'
		passanger_train.route=(route)
	elsif type == 'c'
		cargo_train.route=(route)
	else
		puts "Unknown type"
	end
when 'stationlist'
	route.show_stations
when 'trainlist'
	train.trainlist 
when 'exit'
	end_program = true
else
	puts "Sorry, I didn't understand you."
	end_program = true
end
end