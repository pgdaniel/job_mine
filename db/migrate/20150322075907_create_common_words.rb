class CreateCommonWords < ActiveRecord::Migration
  def change
    create_table :common_words do |t|
      t.string :word

      t.timestamps null: false
    end
  end
end
