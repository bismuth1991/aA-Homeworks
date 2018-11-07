class CreatePeopleTable < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |person|
      person.string :name, null: false
      person.integer :house_id
      person.timestamps
    end
  end
end
