class AddDescriptionColumnToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :description, :text
  end
end
