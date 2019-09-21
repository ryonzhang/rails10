class CreateIssues < ActiveRecord::Migration[4.2]
    create_table :issues do |t|
      t.string :title
      t.timestamps
    end
end
