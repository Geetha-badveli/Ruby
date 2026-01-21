class Product < ApplicationRecord
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
end
