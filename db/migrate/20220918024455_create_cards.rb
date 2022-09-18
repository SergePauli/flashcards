class CreateCards < ActiveRecord::Migration[6.1]
  def up
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.integer :level, index: true, default: 0
      t.datetime :lock_to, index: true
      t.integer :attempts, index: true, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :cards
  end
end
