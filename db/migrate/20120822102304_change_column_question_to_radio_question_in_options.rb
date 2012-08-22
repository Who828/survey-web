class ChangeColumnQuestionToRadioQuestionInOptions < ActiveRecord::Migration
  def up
    rename_column :options, :question_id, :radio_question_id
  end

  def down
    rename_column :options, :radio_question_id, :question_id
  end
end
