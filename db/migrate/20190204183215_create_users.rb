class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.belongs_to :city
      t.string :first_name
      t.string :last_name
      t.string :username, presence: true
      t.integer :age
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
