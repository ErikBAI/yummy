class Item < ActiveRecord::Base
  belongs_to :dish
  belongs_to :cart

end
