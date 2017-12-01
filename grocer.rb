require 'pry'

def consolidate_cart(cart)
  hash = Hash.new
  cart.each do |cartItem|
    cartItem.each do |item, attributes|
      if hash.keys.include?(item)
        hash[item][:count] += 1
      else
        hash[item] = attributes
        hash[item][:count] = 1
      end
    end
  end
  hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart[coupon[:item]] && cart[coupon[:item]][:count] >= coupon[:num]
      if cart["#{coupon[:item]} W/COUPON"]
        cart["#{coupon[:item]} W/COUPON"][:count] += 1
      else
        cart["#{coupon[:item]} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{coupon[:item]} W/COUPON"][:clearance] = cart[coupon[:item]][clearance] 
      end
      cart[coupon[:item]][:count] -= coupon[:num]
    end
  end
  cart
end

# def apply_clearance(cart)
#
# end

# def checkout(cart, coupons)
#   # code here
# end
