class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.text :image

      t.timestamps
    end
  end
end
