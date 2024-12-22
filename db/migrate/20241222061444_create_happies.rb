class CreateHappies < ActiveRecord::Migration[8.0]
  def change
    create_table :happies do |t|
      t.string :text

      t.timestamps
    end
  end
end
