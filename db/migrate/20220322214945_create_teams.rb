class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :expansion_team
      t.integer :number_of_players
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
