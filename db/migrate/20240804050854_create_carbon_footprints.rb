class CreateCarbonFootprints < ActiveRecord::Migration[7.0]
  def change
    create_table :carbon_footprints do |t|
      t.string :type_of_public_transport
      t.string :type_of_car
      t.integer :hours_driven_per_week
      t.integer :monthly_electricity_usage
      t.string :diet
      t.string :waste_management
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
