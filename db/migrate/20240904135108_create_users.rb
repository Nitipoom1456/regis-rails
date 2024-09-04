class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.date :birthday
      t.string :gender
      t.string :email
      t.string :phone
      t.text :subject

      t.timestamps
    end
  end
end
