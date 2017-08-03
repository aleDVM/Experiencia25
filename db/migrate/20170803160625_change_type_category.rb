class ChangeTypeCategory < ActiveRecord::Migration[5.1]
  def up
    change_table :sales do |t|
      t.change :category, :string
    end
  end

  def down
    change_table :sales do |t|
      t.change :category, :integer
    end
  end
end
