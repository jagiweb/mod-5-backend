class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :date
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
