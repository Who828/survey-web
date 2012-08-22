class AddColumnTypeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :type, :string
  end
end
