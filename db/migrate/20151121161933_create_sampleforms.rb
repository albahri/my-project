class CreateSampleforms < ActiveRecord::Migration
  def change
    create_table :sampleforms do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :age

      t.timestamps null: false
    end
  end
end
