class Zoo
  attr_reader :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @cages = []
    @employees = []

    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    # opening = date <=> @opening_date
    # closing = date <=> @closing_date
    # opening == 1 && closing == -1 || opening == 0 || closing == 0

    @opening_date <= date && date <= @closing_date

  end
  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    output = ""
    @employees.each do |employee|

      output += "#{employee.greet}\n"
    end

    @cages.each do |cage|
      if !cage.empty?
        output += "#{cage.animal.speak}\n"
      end 
    end
    return output
  end

end

class ZooAtCapacity < StandardError
end
