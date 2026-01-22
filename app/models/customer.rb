class Customer < ApplicationRecord
 validates :email, presence:true
 validates :email, uniqueness:true
 validates :email, absence:false
 
 validates :name, format: {with: /\A[a-zA-Z]+\z/,message: "only letters are allowed"}
validates :name, profanity: true
validates :email, profanity: true
  
# validates :name, presence:true
# validates :name, uniqueness:true
    
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
