class CreateRelationshihps < ActiveRecord::Migration[6.0]
  def change
    create_table :relationshihps do |t|
      t.integer :follower_id
t.integer :followed_id
    end
  end
end
