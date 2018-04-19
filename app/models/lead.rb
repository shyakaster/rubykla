class Lead < ApplicationRecord
  validates :email,:name, presence: true
end
