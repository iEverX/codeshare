class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.integer :code_id, :null => false
      t.string :description, :null => false
      t.string :language, :null => false
      t.string :name, :null => false
      t.integer :version, :null => false, :default => 1
      t.text :source, :null => false

      t.timestamps
    end
  end
end
