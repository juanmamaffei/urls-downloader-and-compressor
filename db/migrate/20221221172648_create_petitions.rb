class CreatePetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :petitions do |t|
      t.string :zip_url
      t.integer :status

      t.timestamps
    end
  end
end
