class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :desc
      t.string :cmd
      t.string :p1
      t.string :p1_desc
      t.string :p2
      t.string :p2_desc
      t.string :p3
      t.string :p3_desc
      t.string :p4
      t.string :p4_desc
      t.string :o1
      t.string :o1_desc
      t.string :o2
      t.string :o2_desc
      t.string :o3
      t.string :o3_desc
      t.string :o4
      t.string :o4_desc

      t.timestamps
    end
  end
end
