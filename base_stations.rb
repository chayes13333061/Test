require_relative 'useful_methods.rb'

class BaseStations

  attr_reader :base_stations

  def initialize
    @base_stations = []
  end

  def add_base_station(base_station)
    @base_stations.push(base_station)
  end

  def assign_coverage
    @base_stations.each do |station|
      station.cell.coverage(UsefulMethods.nearest_station_distance(station.cell, @base_stations))
    end
  end

  def to_s
    str = @base_stations.inject(""){|str, station| str + station.to_s}
  end
end