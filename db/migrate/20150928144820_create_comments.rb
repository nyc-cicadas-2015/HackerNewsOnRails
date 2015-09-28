class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
