class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :animal_type
      t.integer :age
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
