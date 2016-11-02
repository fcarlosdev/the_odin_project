def stock_picker(prices)
  profity = 0
  best_days = Array.new(2)

  prices.each_index do |buy|
    for sell in (buy+1)..prices.length-1
      value_transaction = (prices[sell] - prices[buy])
      if ( value_transaction > profity )
        profity = value_transaction
        best_days[0] = buy
        best_days[1] = sell
      end
    end
  end
  return best_days
end
puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect
