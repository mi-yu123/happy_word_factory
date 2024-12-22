class CreateUnhappies < ActiveRecord::Migration[8.0]
  def change
    create_table :unhappies do |t|
      t.string :text

      t.timestamps
    end
  end
end
