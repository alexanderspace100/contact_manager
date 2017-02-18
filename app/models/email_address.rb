class EmailAddress < ApplicationRecord
  validates :address, :person_id, presence: true
  belongs_to :person
end
