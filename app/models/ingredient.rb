class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  has_many :cocktails, through: :doses
  before_destroy :check_for_doses

  def check_for_doses
    false if doses.count.positive?
  end
end
