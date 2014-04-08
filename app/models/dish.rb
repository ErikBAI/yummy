class Dish < ActiveRecord::Base
  belongs_to :restaurant

  validates :name, :price, presence: true
  has_many :items

  before_destroy :ensure_not_referenced_by_any_item

  private
  def ensure_not_referenced_by_any_item
  	if items.empty?
  		return true
  	else
  		errors.add(:base, 'Items present!')
  		return false
  	end
  end

end
