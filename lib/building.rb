class Building
  attr_reader :units,
              :renters,
              :rented_units

  def initialize()
    @units = []
    @renters = []
    @rented_unit = []
  end

  def add_unit(unit)
    @units << unit
  end

  def add_renter(renter)
    @renters << @units[1]
  end

  def average_rent
    @units.sum do |unit|
      unit.monthly_rent.to_f / @units.length
    end
  end

  def rented_units
    @rented_units << @unit.rented
  end

  # def renters
  #   @add_renter.each do |renter|
  #     @renters << unit.renter
  #   end
  # end

  def units_by_number_of_bedrooms
    # number_of_bedrooms = {}
    # Hash @units.each do |unit|
    #   number_of_bedrooms[unit.number_of_bedrooms] << unit.name
    # end
    #NOT SURE HOW TO WRITE THIS HASH :(
  end


end
