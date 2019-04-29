class AddStatusToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :status, :boolean
  end
end
