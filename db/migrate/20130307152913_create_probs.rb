class CreateProbs < ActiveRecord::Migration
  def change
    create_table :probs do |t|
      t.text :title
      t.text :state
      t.string :url
      t.string :auther

      t.timestamps
    end
  end
end
