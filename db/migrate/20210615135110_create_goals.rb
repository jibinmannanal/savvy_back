class CreateGoals < ActiveRecord::Migration[6.1]
  def change
  create_table :goals do |t|
    t.references :user, null: false, foreign_key: true
    t.string :name

    t.timestamps
  end
  end
end
