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
  
  updated_array = []
  index = 0
  while coupons[index] do 
    item_name = coupons[index][:name]
    if (coupons[index][:num] < item_in_cart[:count])
      item_in_cart[:count] -= coupons[index][:num]
      coupon_hash = {
        
      }
    end
    index += 1
  end
  
  
  updated_array
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

