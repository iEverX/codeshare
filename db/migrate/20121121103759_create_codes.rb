class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.text :snippet, :null => false
      t.string :author, :null => false
      t.string :password, :null => false
      t.integer :version, :null => false, :default => 1
      t.string :commitmsg
      t.string :language, :null => false

      t.timestamps
    end
  end
end
