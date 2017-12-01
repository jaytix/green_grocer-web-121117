require 'pry'

def consolidate_cart(cart)
  cart.each_with_object({}) do |item, result|
    item.each do |type, attributes|
      if result[type]
        attributes[:count] += 1
      else
        result[type] = attributes
        attributes[:count] = 1
      end
    end
  end
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart[coupon[:item]] && cart[coupon[:item]][:count] >= coupon[:num]
      if cart["#{coupon[:item]} W/COUPON"]
        cart["#{coupon[:item]} W/COUPON"][:count] += 1
      else
        binding.pry
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
