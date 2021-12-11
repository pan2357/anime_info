class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :headline
      t.text :content

      t.timestamps
    end
  end
end
