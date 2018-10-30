require 'pry'

class Item 
    attr_accessor :price, :item

    def initialize(item, price)
        @item = item
        @price = price 
    end

end


class CashRegister
    attr_accessor :total, :all
    attr_reader :discount


    def initialize(discount = nil)
        @discount = discount
        @all = [ ]
    end

    def total
        prices = self.all.map{|item| item.price}

        @total = prices.inject(:+)
        
        @total
        # binding.pry
    end

    def add_item(item, price, qty = 1)
        num = qty
        while num > 0
            new_item = Item.new(item, price)
            self.all << new_item
            self.all
            num-= 1
        end
        self.total 
    end


    def items
        self.all.map{|item| item.item}
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
        self.all.pop()
    end
    binding.pry
end



