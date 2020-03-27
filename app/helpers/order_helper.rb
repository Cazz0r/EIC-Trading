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

  def self.time_options
    [["0000 - 0400 UTC", 0],
    ["0400 - 0800 UTC", 1],
    ["0800 - 1200 UTC", 2],
    ["1200 - 1600 UTC", 3],
    ["1600 - 2000 UTC", 4],
    ["2000 - 2400 UTC", 5]]
  end

  def self.location_text(location)
    return "Bubble" if location == ORDER_LOCATION_BUBBLE
    return "Colonia" if location == ORDER_LOCATION_COLONIA
  end

  def self.form_commodity_list
    [
      ["Bromellite", "Bromellite"],
      ["Fujin Tea", "Fujin Tea"],
      ["Kamitra Cigars", "Kamitra Cigars"],
      ["Kongga Ale", "Kongga Ale"],
      ["Lavian Brandy", "Lavian Brandy"],
      ["Meta Alloy", "Meta Alloy"],
      ["Modular Terminals", "Modular Terminals"],
      ["Occupied Escape Pods", "Occupied Escape Pods"],
      ["Osmium", "Osmium"],
      ["Painite", "Painite"],
      ["Soontil Relics", "Soontil Relics"],
      ["Xihe Companions", "Xihe Companions"],
    ]
  end
end