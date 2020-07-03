class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :string
      t.string :body
      t.string :text

      t.timestamps
    end
  end
end
