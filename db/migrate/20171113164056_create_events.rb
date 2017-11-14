class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :title
      t.integer :location_id
      t.boolean :admittance, default: true
      t.integer :host_id
    end
  end
end
