5000.times do |x|
  amount = (rand * 1000).round
  Order.create(description: "#{amount} Bromellite", account_id: 1, user_id: 1, order_type: rand.round, status: (rand * 3).round, platform: (rand * 2).round, time_window: (rand * 4).round, order_quantity: amount, order_commodity: "Bromellite")
end