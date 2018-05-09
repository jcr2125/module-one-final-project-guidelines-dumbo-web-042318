class CreateRepoContrs < ActiveRecord::Migration[5.0]
  def change
    create_table :repo_contrs do |t|
      t.integer :repository_id
      t.integer :contributor_id
    end
  end
end
