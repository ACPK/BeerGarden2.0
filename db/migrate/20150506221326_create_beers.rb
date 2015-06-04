class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :category
      t.decimal :alc_percent
      t.string :description

      t.timestamps null: false
    end
  end
end
