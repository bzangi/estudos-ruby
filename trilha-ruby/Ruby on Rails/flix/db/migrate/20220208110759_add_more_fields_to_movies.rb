class AddMoreFieldsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :director, :string, default: "unknown"
    add_column :movies, :duration, :string
    add_column :movies, :image_file_name, :string, default: "placeholder.png"
  end
end
