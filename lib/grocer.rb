def find_item_by_name_in_collection(name, collection)
  collection.find do |item|
    item[:item] == name
  end
end

def consolidate_cart(cart)
  consolidated_cart = []
  cart.each do |item_hash|
    count = count_item_in_cart(item_hash, cart)
    if !consolidated_cart.include?(item_hash)
      consolidated_cart << item_hash
      consolidated_cart.last[:count] = count
    end
  end
  consolidated_cart
end

def count_item_in_cart(item, cart)
  array_of_specified_items = cart.select do |each_hash|
    each_hash[:item] == item[:item]
  end
  array_of_specified_items.count
end