class CreateConfigures < ActiveRecord::Migration
  def change
    create_table :configures do |t|
      t.integer :task_id
      t.string :s1
      t.string :s2
      t.string :s3
      t.string :s4
      t.string :if1
      t.string :if2
      t.string :if3
      t.string :if4
      t.string :of1
      t.string :of2
      t.string :of3
      t.string :of4

      t.timestamps
    end
  end
end
