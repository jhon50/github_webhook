class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :issue_id
      t.string :action
      t.text :json_body

      t.timestamps
    end
  end
end
