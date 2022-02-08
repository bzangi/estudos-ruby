class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :stars
      t.text :comment
      t.references :movie, null: false, foreign_key: true #conecta esta tabela a tabela pai (movies)

      t.timestamps
    end
  end
end
