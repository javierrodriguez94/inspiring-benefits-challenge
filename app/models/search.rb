class Search < ApplicationRecord
  has_many :search_facts
  has_many :facts, through: :search_facts
end
