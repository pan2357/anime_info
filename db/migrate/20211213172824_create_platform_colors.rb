class CreatePlatformColors < ActiveRecord::Migration[6.1]
  def change
    create_table :platform_colors do |t|
      t.string :platform
      t.string :color

      t.timestamps
    end
  end
end
