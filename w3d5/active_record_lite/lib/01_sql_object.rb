require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
require 'byebug'
class SQLObject
  def self.columns
    @cols || @cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL

    @cols.first.map(&:to_sym)
  end

  def self.finalize!
    cols = self.columns
    cols.each do |col|
      define_method(col) { self.attributes[col] }

      define_method("#{col}=") {|value| self.attributes[col] = value }
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    tableu_name = self.table_name
    arr_hash = DBConnection.execute(<<-SQL)
      SELECT
        #{tableu_name}.*
      FROM
        #{tableu_name}
    SQL

    self.parse_all(arr_hash)
  end

  def self.parse_all(results)
    results.each do |hash|
      # self.new
    end
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.keys.map!(&:to_sym)
    params.each do |key, value|
      p self.class.columns
      if self.class.columns.include?(key)
        self.send("#{key}=", value)
      else
        raise "unknown attribute \'#{key}\'"
      end
    end
  end

  def attributes
    @attributes || @attributes = {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
