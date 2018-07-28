require_relative 'employee.rb'

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []

    # boss.employees << self unless boss.nil?

     #daryl(manager), johny(employee), susan
    #does Ned have a boss? no
    #boss = nil / boss default variable????
      #when we make a new employee, we notify the boss
    #if boss is not nil  = they have a boss
      #boss.employees << self

  end

#manager/employee = employee.bonus(multiplier)
  def bonus(multiplier)
    total_salary_of_employees = 0
    employees.each do |employee|
      if employee.class == Manager
        total_salary_of_employees += employee.bonus(multiplier)
      else
        total_salary_of_employees += employee.salary
      end
    end
    total_salary_of_employees * multiplier
  end

end
