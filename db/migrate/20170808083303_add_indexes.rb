class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :answers, :user_id
    add_index :answers, :question_id
    add_index :questions, :user_id
  end
end
