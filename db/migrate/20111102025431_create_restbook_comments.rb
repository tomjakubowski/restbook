class CreateRestbookComments < ActiveRecord::Migration
  def change
    create_table :restbook_comments do |t|
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
