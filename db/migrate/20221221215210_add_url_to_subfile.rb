class AddUrlToSubfile < ActiveRecord::Migration[7.0]
  def change
    add_column :subfiles, :url, :string
  end
end
