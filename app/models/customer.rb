class Customer < ApplicationRecord
    def check_email
        # it is present are not
        if email.present?
            true
        else
            false
        end
    end
    def name_check
        #check name has only alphabetic values
        if name.match?(/^[a-zA-Z]+$/)
            puts "Valid name"
        else
            puts "Invalid name"
        end
    end
end
