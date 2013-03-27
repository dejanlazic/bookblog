class RemoveTimestampsFromAuthorsBooks < ActiveRecord::Migration
  def up
    remove_timestamps :authors_books
  end

  def down
  end
end
