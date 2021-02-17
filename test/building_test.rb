require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'
require './lib/renter'

class BuildingTest < Minitest::Test
  def test_building_exists
    building = Building.new

    assert_instance_of Building, building
    assert_equal [], building.units
  end

  def test_building_has_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal [unit1, unit2], building.units
    assert_equal [], building.renters
  end

  # def test_units_can_add_renters
  #   building = Building.new
  #   unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  #   unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  #   renter1 = Renter.new("Aurora")
  #   renter2 = Renter.new("Tim")
  #
  #   building.add_unit(unit1)
  #   building.add_unit(unit2)
  #
  #   unit1.add_renter(renter1)
  #
  #   assert_equal ["Aurora"], building.renters
  #
  #   unit2.add_renter(renter2)
  #
  #   assert_equal ["Aurora", "Tim"], building.renters
  # end

  def test_average_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal 1099.5, building.average_rent
  end

  # def test_building_has_four_units_one_renter
  #   building = Building.new
  #   unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  #   unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  #   unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
  #   unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
  #   renter1 = Renter.new("Spencer")
  #
  #   building.add_unit(unit1)
  #   building.add_unit(unit2)
  #   building.add_unit(unit3)
  #
  #   unit2.add_renter(renter1)
  #
  #   assert_equal [unit2], building.rented_units
  #   assert_equal renter1, building.renter_with_highest_rent
  # end

  def test_units_by_number_of_bedrooms
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})

    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    building.add_unit(unit4)

    number_of_bedrooms = {
      3 => ["D4" ],
      2 => ["B2", "C3"],
      1 => ["A1"]
    }

    assert_equal number_of_bedrooms, building.units_by_number_of_bedrooms
  end
end
