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
    item_hash = find_item_by_name_in_collection(cart[index][:item], array_unique)
    if item_hash 
      item_hash[:count] += 1
    else
      item_hash = cart[index]
      item_hash[:count] = 1
      array_unique << item_hash
    end
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
  # iterate each cart item
  while cart[index] do 
    cart_item = cart[index]
    coupon_item = find_item_by_name_in_collection(cart_item[:item], coupons)
    if coupon_item
      if cart_item[:count] >= coupon_item[:num]
        cart_item[:count] -= coupon_item[:num]
        updated_cart << cart_item
        updated_cart << {
          :item => "#{coupon_item[:item]} W/COUPON",
          :price => (coupon_item[:cost] / coupon_item[:num]),
          :clearance => cart_item[:clearance],
          :count => coupon_item[:num]
        }        
      end
    else
      updated_cart << cart_item
    end
    index += 1 
  end
  updated_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  updated_cart = []
  index = 0
  while cart[index] do 
    cart_item = cart[index]
    if cart_item[:clearance] == true
      cart_item[:price] -= (cart_item[:price] * 0.2)
    end
    updated_cart << cart_item
    index += 1
  end
  updated_cart
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
  consolidated_cart = consolidate_cart(cart)
  coupon_applied_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(coupon_applied_cart)
  total = 0 
  index = 0
  while final_cart[index] do 
    total += final_cart[index][:price] * final_cart[index][:count]
    index += 1 
  end
  if total > 100 
    total -= (0.1 * total)
  end
  total
end

items = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "KALE", :price => 3.00, :clearance => false},
  {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
  {:item => "ALMONDS", :price => 9.00, :clearance => false},
  {:item => "TEMPEH", :price => 3.00, :clearance => true},
  {:item => "CHEESE", :price => 6.50, :clearance => false},
  {:item => "BEER", :price => 13.00, :clearance => false},
  {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
  {:item => "BEETS", :price => 2.50, :clearance => false},
  {:item => "SOY MILK", :price => 4.50, :clearance => true}
]
    
coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]
    
t = [
  { :item => "DOG FOOD" },
  { :item => "WINE" },
  { :item => "STRYCHNINE" }
]

