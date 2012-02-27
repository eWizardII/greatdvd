class AddMoviesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :movies, :string
  end
end
