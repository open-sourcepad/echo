class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :answer
      t.references :question

      t.timestamps null: false
    end
  end
end
