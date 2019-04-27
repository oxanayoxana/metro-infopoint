require 'yaml'

class Map
	attr_reader :metrolines

	def initialize map_yml_path
		@metrolines = load_metrolines(map_yml_path)
	end

	def load_metrolines map_yml_path
		config_map = YAML.load(File.read(map_yml_path))
		config_map["stations"]
	end

end

