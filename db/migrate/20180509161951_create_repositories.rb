class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.integer :owner_id
      t.integer :language_id
      t.string :description
      t.integer :forks
      t.integer :watchers
    end
  end
end
