class Item < ApplicationRecord
  belongs_to :category
  validates_presence_of :name
  validates_uniqueness_of :name

  before_validation :downcase_name

  def downcase_name
    if self.name?
      self.name.downcase!
    end
  end

end
