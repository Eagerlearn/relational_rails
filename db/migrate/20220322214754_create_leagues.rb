class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :professional
      t.integer :years_in_existence

      t.timestamps
    end
  end
end
