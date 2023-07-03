class CreateUserForums < ActiveRecord::Migration[7.0]
  def change
    create_table :user_forums do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :forum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
