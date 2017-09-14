module OrderHelper
  def self.status_text(status)
  	return "Pending" if status == ORDER_OPEN
    return "Underway" if status == ORDER_UNDERWAY
    return "Complete" if status == ORDER_CLOSED
    return "Canceled" if status == ORDER_CANCELED
  end

  def self.platform_text(platform)
  	return "PC" if platform == ORDER_PLATFORM_PC
    return "XBOX" if platform == ORDER_PLATFORM_XBOX
    return "PS4" if platform == ORDER_PLATFORM_PS4
  end

  def self.type_text(order_type)
  	return "Order" if order_type == ORDER_BUY
    return "Contribution" if order_type == ORDER_CONTRIBUTE
  end
end