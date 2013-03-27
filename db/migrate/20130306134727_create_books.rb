class CreateBooks < ActiveRecord::Migration
  def change
    drop_table :books

    create_table :books do |t|
      t.string :title
      t.integer :genre_id

      t.timestamps
    end
  end
  
  def down
    drop_table :books
  end  
end
