class CreateConfigures < ActiveRecord::Migration
  def change
    create_table :configures do |t|
      t.integer :task_id
      t.string :s1
      t.string :s2
      t.string :s3
      t.string :s4
      t.string :f1
      t.string :f2
      t.string :f3
      t.string :f4

      t.timestamps
    end
  end
end
