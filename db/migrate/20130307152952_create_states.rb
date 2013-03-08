class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :prob_id
      t.string :compo
      t.integer :ans

      t.timestamps
    end
  end
end
