class AddUserIdToHacker < ActiveRecord::Migration[6.1]
  def change
    add_column :hackers, :user_id, :integer
    add_index :hackers, :user_id
  end
end
