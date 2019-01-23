class House < ActiveRecord::Base
  validates :address, presence: true, uniqueness: true

  # def persons
  #   Person.where(house_id: self.id)
  # end

  has_many :persons, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
  }

end
