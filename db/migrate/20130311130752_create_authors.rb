class CreateAuthors < ActiveRecord::Migration
  def change
    drop_table :authors

    create_table :authors do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
  
  def down
    drop_table :authors
  end 
end
