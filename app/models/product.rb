class Product < ApplicationRecord
#validates :stock, numericality: true
#validates :stock, length:{ minimum: 10,maximum: 20}
#validates :description, length: { maximum: 5}
validates :price, numericality:{ greater_than_or_equal_to: 3}
validate :check_price
    def self.limit_with_active
        Product.all.limit(10).select{|n| n.is_active=true}
    end
    def check_availability
        #check stock value more than 0
        if stock>0
            true
        else
            false  
        end
    end
    def apply_discount(discount_percentage)
        #use case statments and calculate discount
            amount =price+((price/100)*discount_percentage)
    end
    def total_amount
       #call the check_availabelity (if true) and than apply_discount use any math
       #(round ) method use it and calculate the total.
       if check_availability
         return apply_discount(10)
       else
        return "product not available"
       end
    end
    #custom exceptions
    def check_price
        if stock==0 && price>0
            errors.add "stock must be greaterthan 0"
        end  
    end
end
