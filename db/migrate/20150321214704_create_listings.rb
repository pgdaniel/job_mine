class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :company
      t.string :company_url
      t.string :url
      t.belongs_to :search_term, index: true

      t.timestamps null: false
    end
    add_foreign_key :listings, :search_terms
  end
end
