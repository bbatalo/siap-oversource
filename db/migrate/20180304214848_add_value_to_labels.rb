class AddValueToLabels < ActiveRecord::Migration[5.1]
  def change
    add_column :labels, :value, :string
  end
end
