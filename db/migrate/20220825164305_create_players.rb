class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :drafted
      t.integer :rating

      t.timestamps
    end
  end
end
