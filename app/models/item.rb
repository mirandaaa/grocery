class Item < ApplicationRecord
  belongs_to :category
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false

  # before_save :downcase_name
  #
  # def downcase_name
  #   self.name.downcase!
  # end

end
