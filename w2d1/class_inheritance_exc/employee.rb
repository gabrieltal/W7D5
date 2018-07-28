require_relative 'manager.rb'

class Employee
attr_reader :name, :title, :salary, :boss, :bonus

def initialize(name, title, salary, boss)
  @name = name
  @title = title
  @salary = salary
  @boss = boss
  @boss.employees << self unless boss.nil?
end

def bonus(multiplier)
  @bonus = salary * multiplier
end

def self.form_company

end


end

# Manager.form_company
# p ned.name
# p darren.name
# p shawna.boss
# # p david.bossruby
# ned = Manager.new('ned', 'Founder', 1000000, nil)
# darren = Manager.new('Darren', 'TA manager', 78000, ned)
# shawna = Employee.new('Shawna', 'TA', 12000, darren)
# david = Employee.new('David', 'TA', 10000, darren)
