class CreateSearchTerms < ActiveRecord::Migration
  def change
    create_table :search_terms do |t|
      t.string :value
      t.belongs_to :job, index: true

      t.timestamps null: false
    end
    add_foreign_key :search_terms, :jobs
  end
end
