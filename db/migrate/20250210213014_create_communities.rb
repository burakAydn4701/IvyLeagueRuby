class CreateCommunities < ActiveRecord::Migration[8.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.string :banner
      t.string :profile_photo

      t.timestamps
    end
  end
end
