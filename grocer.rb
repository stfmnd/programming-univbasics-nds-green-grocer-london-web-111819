require 'pry'

def find_item_by_name_in_collection(string, array)
  array.each do |hash|
    if hash.has_value?(string)
      return hash
    end
  end
  nil
end

def consolidate_cart(cart)
  new_cart = []
  cart.each do |hash|
    hash[:count] = 1
    if new_cart.include?(hash) == false
      new_cart.push(hash)
    else
      new_cart.each do |item|
        item[:count] += 1
      end
    end
  end
   new_cart
end

def apply_coupons(cart, coupons)
  cart.each do |item_hash|
    coupons.each do |coupon_hash|
      if item_hash[:item] == coupon_hash[:item]
        coupon = {
          :item => item_hash[:item] + ' W/COUPON',
          :price => coupon_hash[:cost] / coupon_hash[:num],
          :clearance => item_hash[:clearance],
          :count => coupon_hash[:num]
        }
        item_hash[:count] = item_hash[:count] - coupon_hash[:num]
        cart.push(coupon)
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |hash|
    if hash[:clearance] == true
      hash[:price] = hash[:price] * 0.8
    end
  end
end

def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  apply_coupons(new_cart, coupons)
  apply_clearance(new_cart)
  total = 0
  new_cart.each do |item_hash|
    total += item_hash[:price] * item_hash[:count]
  end
  total
end

