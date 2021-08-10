require "pry"

class CashRegister
    attr_accessor :discount, :total, :items, :prices, :items2

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
        @items2 = []
    end

    def total
        @total
    end

    def add_item(item, price, quantity=1)
        @total += price*quantity
        counter = quantity
        @items << {name: item, quantity: quantity, price: price}
        until quantity == 0
            @items2 << item
            quantity-=1
        end 
        return @total
    end

    def apply_discount
        if (discount==nil)
            return "There is no discount to apply."
        else
            @total -= (@discount/100.0) * @total
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @items2
    end

    def void_last_transaction
        if @items.length == 0
            @total = 0.0
            return @total
        else
            @total -= @items.last[:price] * @items.last[:quantity]
            @items.pop()
        end
    end

end
