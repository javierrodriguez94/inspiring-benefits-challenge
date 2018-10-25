class Fact < ApplicationRecord
  has_many :search_facts
  has_many :searches, through: :search_facts
end
