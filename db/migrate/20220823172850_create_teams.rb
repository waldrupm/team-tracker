class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :pro
      t.integer :last_year_finish

      t.timestamps
    end
  end
end
