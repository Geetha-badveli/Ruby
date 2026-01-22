class Product < ApplicationRecord
#validates :stock, numericality: true
#validates :stock, length:{ minimum: 10,maximum: 20}
#validates :description, length: { maximum: 5}
validates :price, numericality:{ greater_than_or_equal_to: 3}
validates :is_active, inclusion: { in: [true], message: "product must be active " }
validate :check_price
validate :check_name
validate :price_active
validate :check_description

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
    #custom exceptions/validation
    def check_name
        unless name =~ /\A[a-zA-Z0-9 ]+\z/
          errors.add(:name, "can only contain letters, numbers, and spaces")
        end
    end
    #is product is active than only add the price
    def price_active
        if is_active == false 
            if  price >0
                errors.add "can't add price when product is inactive"
            else
                if stock>0
                    errors.add "can't add stock when product is inactive"
                end
            end
        end 
    end
    # if product is active than only add the stock
    def stock_active
        if is_active == false  && stock >0
             errors.add "can't add stock when product is inactive"
        end 
    end

    def check_description
        if description =~ /[^a-zA-Z0-9\s]/
          errors.add(:description, "must not contain special characters")
        end
    end
end
