class AddTitleAndDescriptionToWebsites < ActiveRecord::Migration[6.1]
  def change
    add_column :websites, :title, :string
    add_column :websites, :description, :text
  end
end
