class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.column :title, :text
      t.column :description, :text
      t.column :votes, :integer
      t.column :user_id, :integer
      t.column :best_answer_id, :integer
      t.column :views, :integer
      t.timestamps
    end
  end
end
