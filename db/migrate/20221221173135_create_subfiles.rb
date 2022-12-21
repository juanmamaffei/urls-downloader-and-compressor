class CreateSubfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :subfiles do |t|
      t.belongs_to :petition, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
