class Company < ApplicationRecord
  validates :name, presence: true

  include Contact
end
