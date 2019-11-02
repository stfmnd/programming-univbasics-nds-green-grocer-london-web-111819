require 'pp'
require 'pry'

def find_item_by_name_in_collection(name, collection)
  counter = 0
  while counter < collection.length do 
    if collection[counter][:item] == name
      return collection[counter]
    end
    counter += 1
  end
end

def consolidate_cart(cart)
 new_cart = []
 cart.each do |item|
   new_cart_item = find_item_by_name_in_collection(item[:item], new_cart)
   if new_cart_item
     new_cart_item[:count] += 1
   else
     new_cart_item = {
       :item => item[:item],
       :price => item[:price],
       :clearance => item[:clearance],
       :count => 1
     }
     new_cart.push(new_cart_item)
   end
 end
 new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
