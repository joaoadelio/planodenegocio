class FixColumnName < ActiveRecord::Migration[5.2]
  def up
    remove_column :questions, :group
  end
end
