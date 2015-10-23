class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description, null: false, default: ''
      t.attachment :image
      t.integer :position, default: 1, null: false
      t.references :question

      t.timestamps null: false
    end
  end
end
