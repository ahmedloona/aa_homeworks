class Person < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :house_id, presence: true

  # def house
  #   House.find(self.house_id)
  # end

  belongs_to :house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
  }
end
