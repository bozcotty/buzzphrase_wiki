class CreateTopicsUsers < ActiveRecord::Migration
  def change
    create_table :topics_users do |t|
      t.belongs_to :user
      t.belongs_to :topic

      t.timestamps
    end
  end
end
