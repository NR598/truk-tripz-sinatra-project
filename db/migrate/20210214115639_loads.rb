class Loads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.integer  :user_id
      t.string  :load_name
      t.string  :first_name
      t.string  :last_name
      t.string  :tractor_number
      t.string  :trailer_number
      t.string  :commodity
      t.integer :weight
      t.string  :pickup_city
      t.string  :delivery_city
    end
  end
end
