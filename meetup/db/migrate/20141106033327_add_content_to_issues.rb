class AddContentToIssues < ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :content, :text
  end
end
