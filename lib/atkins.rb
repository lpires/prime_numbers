require 'bitarray'

module Atkins

  def self.primes uptoNumber
    isPrime = self.calculate uptoNumber
    isPrime = isPrime.map.with_index{ |x, i| x == 1 ? i : nil }
    isPrime.compact
  end

  def self.count uptoNumber
    isPrime = self.calculate uptoNumber

    totalCount,i = 0, 0
    (2..uptoNumber-1).each do |i|
      if (isPrime[i]==1)
        totalCount += 1
      end
    end

    totalCount
  end

  private

  def self.calculate uptoNumber
    n = 0

    isPrime = BitArray.new(uptoNumber + 1)


    #3x^2 + y^2 computation
    self.tree_x2_plus_y2 n, uptoNumber, isPrime


    #4x^2 + y^2 computation
    self.four_x2_plus_y2 n, uptoNumber, isPrime


    #3x^2 - y^2 computation
    self.tree_x2_less_y2 n, uptoNumber, isPrime


    squareRoot = Math.sqrt(uptoNumber);
    (5..squareRoot).each do |n|
      if (isPrime[n] == 1)
        k = n * n;
        z=k
        while z <= uptoNumber
          isPrime[z] = 0
          z += k
        end
      end
    end

    isPrime[2] = 1 if(uptoNumber.size - 1 > 2)
    isPrime[3] = 1 if(uptoNumber.size - 1 > 3)
    isPrime
  end

  def self.tree_x2_plus_y2 n, uptoNumber, isPrime
    i, xStepsize, y_limit= 0, 3, 0
    temp = Math.sqrt((uptoNumber - 1) / 3).to_i
    while i < (12 * temp)
      xStepsize += i
      y_limit = (12 * Math.sqrt(uptoNumber - xStepsize).to_i) - 36
      n = xStepsize + 16

      j = -12
      while j < (y_limit + 1)
        n += j
        isPrime[n] = isPrime[n] == 1 ? 0 : 1
        j += 72
      end

      n = xStepsize + 4

      j = 12
      while j < (y_limit + 1)
        n += j
        isPrime[n] = isPrime[n] == 1 ? 0 : 1
        j += 72
      end
      i += 24
    end
  end

  def self.four_x2_plus_y2 n, uptoNumber, isPrime
    xStepsize = 0
    temp = 8 * Math.sqrt((uptoNumber - 1) / 4).to_i + 4
    i = 4
    while i < temp
      xStepsize += i
      n = xStepsize + 1

      if (xStepsize % 3 != 0)
        tempTwo = 4 * Math.sqrt(uptoNumber - xStepsize).to_i - 3

        j = 0
        while j < tempTwo
          n += j
          isPrime[n] = isPrime[n] == 1 ? 0 : 1
          j += 8
        end
      else
        y_limit = 12 * Math.sqrt(uptoNumber - xStepsize).to_i - 36
        n = xStepsize + 25

        j = -24
        while j < (y_limit + 1)
          n += j
          isPrime[n] = isPrime[n] == 1 ? 0 : 1
          j += 72
        end

        n = xStepsize + 1

        j = 24
        while j < (y_limit + 1)
          n += j
          isPrime[n] = isPrime[n] == 1 ? 0 : 1
          j += 72
        end
      end
      i += 8
    end
  end

  def self.tree_x2_less_y2 n, uptoNumber, isPrime
    xStepsize = 1
    temp = Math.sqrt(uptoNumber / 2).to_i + 1

    i = 3
    while i < temp
      xStepsize += 4 * i - 4
      n = 3 * xStepsize
      s = 4
      if (n > uptoNumber)
        min_y = (Math.sqrt(n - uptoNumber).to_i >> 2) << 2
        yy = min_y * min_y
        n -= yy
        s = 4 * min_y + 4
      else
        s = 4
      end

      j = s
      while j < (4 * i)
        n -= j
        if (n <= uptoNumber && n % 12 == 11)
          isPrime[n] = isPrime[n] == 1 ? 0 : 1
        end
        j += 8
      end
      i += 2
    end

    xStepsize = 0
    i = 2
    while i < temp
      xStepsize += 4 * i - 4
      n = 3 * xStepsize
      s = 0
      if (n > uptoNumber)
        min_y = ((Math.sqrt(n - uptoNumber).to_i >> 2) << 2) - 1
        yy = min_y * min_y
        n -= yy
        s = 4 * min_y + 4
      else
        n -= 1
        s = 0
      end

      j = s

      while j < (4 * i)
        n -= j
        if (n <= uptoNumber && n % 12 == 11)
          isPrime[n] = isPrime[n] == 1 ? 0 : 1
        end
        j += 8
      end

      i += 2
    end
  end
end
