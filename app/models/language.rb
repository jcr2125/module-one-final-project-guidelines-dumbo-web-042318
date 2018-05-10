class Language < ActiveRecord::Base
  has_many :repositories
  has_many :owners, through: :repositories
end
