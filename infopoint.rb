require 'yaml'
require_relative 'schedule.rb'
require_relative 'map.rb'


class Infopoint
	attr_reader :all_stations, :schedule, :map, :end_station, :start_station, :route

	def initialize(schedule, map)
		@route = []
		@schedule = schedule
		@map = map
		@start_station = start_station
		@end_station = end_station
	end

	def get_start_station #if all stations had not only names but ids, it would be easier for foreign person to type just id and not the whole name of station
		puts "Please, enter the id of the starting station:"
		st_input = gets.chomp.to_i #1
		@start_station = st_input - 1 #0 - our exact station
	end

	def start_station_hash
		schedule.find_station_name(@start_station)
	end

	def starting_point #shows the name of the station user has selected, just to confirm all is correct
		start_station_hash["start"]
	end

	def get_end_station
		puts "Please, enter the id of the end station:"
		end_input = gets.chomp.to_i
		@end_station = end_input - 2
	end

	def end_station_hash 
		 schedule.find_station_name(@end_station)
	end

	def ending_point
		end_station_hash["end"]
	end

	def make_route
		if start_station_hash == end_station_hash
			@route << start_station_hash #so we need to calculate time only once
		else
			@route << start_station_hash 
		  @route << end_station_hash
		end
	end

	#main logic to be implemented here in the near future :)

	def show_info
		puts "Your start station: #{starting_point}"
		puts "Your destination: #{ending_point}"
		puts "Travel time: ___"
		puts "Price: ____"
	end


end


schedule = Schedule.new("config_timing1.yml")
map = Map.new("config.yml")

metro = Infopoint.new(schedule, map)
metro.get_start_station
metro.get_end_station

metro.starting_point

metro.ending_point
metro.show_info


