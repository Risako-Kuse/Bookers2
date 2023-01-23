class AddUserIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :User_id, :integer
  end
end
