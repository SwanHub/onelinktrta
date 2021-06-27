class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :description
      t.date :postDate

      t.timestamps
    end
  end
end
