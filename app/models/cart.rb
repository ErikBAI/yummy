class Cart < ActiveRecord::Base
	has_many :items, dependent: :destroy


	def add_dish(dish_id)
    	current_item = items.find_by_dish_id(dish_id)
    	if current_item
      		current_item.quantity += 1
    	else
      		current_item = items.build(dish_id: dish_id)
    	end
    	current_item
  	end

end
