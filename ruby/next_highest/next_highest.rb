module NextHighest

  def next_highest
    value = self.to_s.scan(/\d/).reverse
    upper = 1

    while upper < value.length
      (0..upper).each do |i|
        (i.next..upper).each do |j|
          return sort_value(value, i, j).reverse.join.to_i if value[i] > value[j]
        end
      end
      upper = upper.next
    end
    return value.reverse.join.to_i
  end

  def sort_value value, current, after
    value[after], value[current] = value[current], value[after]
    value[0..after.pred] = value.slice(0, after).sort.reverse
    value
  end

end

Fixnum.send :include, NextHighest
Bignum.send :include, NextHighest
