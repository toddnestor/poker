class Array
  def my_uniq
    inject([]) do |arr, el|
      arr << el unless arr.include?(el)
      arr
    end
  end

  def two_sum
    result = []

    self.each_with_index do |el,idx|
      self.each_with_index do |el_2,idx_2|
        unless idx == idx_2
          pair = [idx,idx_2].sort
          result << pair if el+el_2 == 0 && !result.include?(pair)
        end
      end
    end
    result
  end

  def my_transpose
    result = []

    each do |row|

      row.each_index do |idx|
        result[idx] = [] unless result[idx]
        result[idx] << row[idx]
      end
    end

    result
  end
end

def stock_picker(prices)
  highest = []
  highest_prices = []

  prices.each_with_index do |price,idx|
    prices.drop(idx+1).each_with_index do |price_2,idx_2|
      pair_idxs = [idx,idx_2+idx+1]
      pair = [price,price_2]

      if get_difference(pair) > get_difference(highest_prices)
        highest = pair_idxs
        highest_prices = pair
      end
    end
  end
  highest
end

def get_difference(pair)
  return 0 if pair.length < 2
  pair[1] - pair[0]
end
