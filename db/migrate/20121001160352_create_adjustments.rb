class CreateAdjustments < ActiveRecord::Migration
  def change
    create_table :adjustments do |t|
      t.integer :value

      t.timestamps
    end
  end
end
