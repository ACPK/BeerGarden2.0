class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.decimal :alc_percent, null: false
      t.string :description, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
