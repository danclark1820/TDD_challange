require 'csv'
require 'pry'

class Citizen

  attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate

  def initialize(first_name, last_name, annual_income, tax_paid, tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
  end

  def tax_refund
    @refund = @tax_paid - @annual_income*(@tax_rate*0.01)
  end
end


CSV.foreach('../taxes.csv', headers: true) do |row|
  row = Citizen.new(row[0], row[1], row[2].to_f, row[3].to_f, row[4].to_f)
    if row.tax_refund > 0
      puts "#{row.first_name} #{row.last_name} will recieve a refund of $#{"%0.2f" % row.tax_refund}"
    else
      puts "#{row.first_name} #{row.last_name} owes $#{"%0.2f" % row.tax_refund.abs} in tax"
    end
end

