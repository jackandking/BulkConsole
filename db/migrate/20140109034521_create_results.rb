class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :task_id
      t.integer :return
      t.string :stdout
      t.string :logfile
      t.string :errfile

      t.timestamps
    end
  end
end
