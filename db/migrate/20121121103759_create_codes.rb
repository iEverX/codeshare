class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :author, :null => false
      t.string :page
      t.string :email, :null => false
      t.string :password, :null => false

      t.timestamps
    end
  end
end
