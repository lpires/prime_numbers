require 'atkins'

module NPrime
  include Atkins
  PRIME_NUM, FACTOR = 10, 4

  def self.multi topPrimes=PRIME_NUM
    result = Hash.new
    primes = (Atkins.primes topPrimes * FACTOR)[0..topPrimes-1]
    primes.each do |index|
      result[index] = Array.new
      primes.each do |prime|
        result[index] << index * prime
      end
    end
    result
  end
end