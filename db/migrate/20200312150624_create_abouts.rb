class CreateAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :abouts do |t|
      t.string :title
      t.text :description
      t.text :description2
      t.text :description3

      t.timestamps
    end
  end
end
