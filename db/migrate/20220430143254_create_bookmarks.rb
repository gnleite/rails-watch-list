class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.references :movie
      t.references :list

      t.timestamps
    end
  end
end
