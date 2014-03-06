require 'rspec'
require_relative '../taxes/taxes.rb'

describe Citizen do
  it 'creates a citizen with appropiate monetary attributes' do
    expect(Citizen.new('Johnny','Smith', 120000, 28000, 38).first_name).to eq("Johnny")
    expect(Citizen.new('Johnny','Smith', 120000, 28000, 38).last_name).to eq("Smith")
    expect(Citizen.new('Johnny','Smith', 120000, 28000, 38).annual_income).to eq(120000)
    expect(Citizen.new('Johnny','Smith', 120000, 28000, 38).tax_paid).to eq(28000)
    expect(Citizen.new('Johnny','Smith', 120000, 28000, 38).tax_rate).to eq(38)
  end

  it 'calculates a citizens tax refund' do
    expect(Citizen.new('Johnny','Smith',120000,28000,38).tax_refund).to eq(-17600)
    expect(Citizen.new('Orson', 'Orsillio',40000,8800,18).tax_refund).to eq(1600)
  end
end
