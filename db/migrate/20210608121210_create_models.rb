class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :techs do |t|
      t.string :name
      t.timestamps
    end

    create_table :categories do |t|
      t.belongs_to :tech
      t.string :name
      t.timestamps
    end

    create_table :projects do |t|
      t.belongs_to :category
      t.string :url
      t.integer :stars
      t.integer :forks
      t.datetime :last_update
      t.timestamps
    end
  end
end
