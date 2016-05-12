class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.integer :ranking
      t.references :director, references: :person

      t.timestamps null: false
    end
    add_foreign_key :movies, :person, column: :director_id
  end
end
