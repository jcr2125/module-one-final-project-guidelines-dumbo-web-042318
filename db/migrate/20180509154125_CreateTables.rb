class CreateTables < ActiveRecord::Migration[5.0]
  def change

    create_table :users do |t|
      t.string :name
    end

    create_table :repositories do |t|
      t.string :name
      t.integer :owner_id
      t.integer :lang_id
      t.string :description
      t.integer :forks
      t.integer :watchers
    end

    create_table :languages do |t|
      t.string :name
    end

    create_table :repo_contrs do |t|
      t.integer :repository_id
      t.integer :contributor_id
    end

  end
end
