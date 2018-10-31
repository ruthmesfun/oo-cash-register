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
        @total = 0
        @discount = discount
        @all = [ ]
    end


    def items_total
        prices = self.all.map{|item| item.price}
        current_total = prices.inject(:+)
        self.total = current_total

        self.total
    end

    def add_item(item, price, qty = 1)
        num = qty

        while num >= 1
            new_item = Item.new(item, price)

            self.all << new_item

            self.all
            num-= 1   
        end
        self.items_total
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
        self.all
       if self.all.empty?
        self.total = 0
        return self.total
       end
       
       self.total = self.items_total

       return self.total
    end
end



