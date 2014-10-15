require 'spec_helper'

describe Atkins do
	it 'should calculate the app number upto 10' do
		expect(Atkins.primes 30).to eql([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
  end

  it 'should count the app number upto 10' do
    expect(Atkins.count 30).to eql(10)
  end
end