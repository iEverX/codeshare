class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :code_id, :null => false
      t.string :email, :null => false
      t.string :nick, :null => false
      t.string :page
      t.text :content, :null => false

      t.timestamps
    end
  end
end
