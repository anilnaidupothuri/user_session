class AddColoumnFollowedIdToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :relationships, :followed_id, :integer
  end
end
