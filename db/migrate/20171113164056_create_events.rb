class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :title
      t.integer :location_id
      t.boolean :public
    end
  end
end
