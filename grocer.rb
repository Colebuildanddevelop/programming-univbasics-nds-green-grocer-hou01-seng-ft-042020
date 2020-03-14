def find_item_by_name_in_collection(name, collection)
  index = 0
  hash = {}
  while collection[index] do 
    if name == collection[index][:item]
      return hash = collection[index]
    end
    index += 1
  end
  nil
end

def consolidate_cart(cart)
  array_unique = []
  index = 0
  while cart[index] do 
    item_hash = find_item_by_name_in_collection(cart[index][:item], cart)
    if item_hash[:count]
      item_hash[:count] += 1
    else
      item_hash[:count] = 1
    end
    array_unique << item_hash
    index += 1
  end
  array_unique
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  updated_cart = []
  index = 0
  # iterate each coupon
  while coupons[index] do 
    coupon_item = coupons[index]
    cart_item = find_item_by_name_in_collection(coupon_item_name, cart)
    
    if cart_item 
      if cart_item[:count] > coupon_item[:num]
        cart_item[:count] -= coupon_item[:num]
        updated_cart << cart_item
        updated_cart << {
          :item => "#{coupon_item[:name} W/COUPON",
          :price => (coupon_item[:cost] / coupon_item[:num]),
          :clearance => cart_item[:clearance],
          :count => coupon_item_count
        }        
      else 
        # we have more or == coupons then items in cart
        # ignore original item in place of coupon
        
        
        
      end
    else
      updated_cart << cart
    end
    index += 1 
  end
  updated_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

t = [
  { :item => "DOG FOOD" },
  { :item => "WINE" },
  { :item => "STRYCHNINE" }
]

