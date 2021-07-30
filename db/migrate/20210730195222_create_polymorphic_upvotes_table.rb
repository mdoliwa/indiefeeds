class CreatePolymorphicUpvotesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :upvotes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :upvotable, null: false, polymorphic: true

      t.timestamps
    end
  end
end
