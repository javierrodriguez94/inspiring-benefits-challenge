class CreateSearchFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :search_facts do |t|
      t.references :search, foreign_key: true
      t.references :fact, foreign_key: true

      t.timestamps
    end
  end
end
