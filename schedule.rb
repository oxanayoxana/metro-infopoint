require 'yaml'

class Schedule
	attr_reader :schedule

	def initialize schedule_yml_path
		@schedule = load_schedule(schedule_yml_path)
	end

	def load_schedule(schedule_yml_path)
		config_timing = YAML.load(File.read(schedule_yml_path))
		config_timing["timing"] #array with all timings(hashes)
	end

	def find_station_name(id)
		selected = @schedule.find.with_index {|el, i| i == id}
	end

end



