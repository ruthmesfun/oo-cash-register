require 'pry'
class CashRegister
    attr_accessor :total, :all
    attr_reader :discount


    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @all = []
    end

    def add_item(item, price, qty = 1)
        self.total = self.total + (price * qty)

        qty.times{ self.all << [item, price] }
        self.all
        self.total

    end


    def items
        self.all.map{|item| item[0]}
    end


    def apply_discount
        if !discount.nil? 
            discount = self.discount / 100.to_f
            self.total = self.total * (1 - discount)

            "After the discount, the total comes to $#{self.total.to_i}."

        else
            "There is no discount to apply."
        end

        
    end

    def void_last_transaction
        last_item = self.all.last
        self.total -= last_item[1]

        self.all.pop()

    end
    # binding.pry
end


