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
  
  index = 0
  # iterate each coupon
  while coupons[index] do 
    coupon_item_name = coupons[index][:item]
    coupon_item_count = coupons[index][:count]
    cart_index = 0
    # search for item in cart 
    while cart[cart_index] do 
      cart_item_name = cart[cart_index][:item]
      cart_item_count = cart[cart_index][:count]
      
      if cart_item_name == coupon_item_name
        ## manipulate cart
        if coupon_item_count < cart_item_count
          # reduce cart item count 
          # add w/ coupon item
          cart[cart_index][:count] = cart_item_count - coupon_item_count
          cart << {
            :item => "#{coupon_item_name} W/COUPON",
            :price => 
          }
          
        else if 
          
          
        end
      end

      cart_index += 1
    end
    index += 1
  end
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

