class AddGroupToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :group, :string
  end
end
