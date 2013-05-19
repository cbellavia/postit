class CreateCategoriesPosts < ActiveRecord::Migration
  def up
    create_table :categories_posts do |t|
      t.string :category_id
      t.string :post_id
      t.timestamps
    end
  end

  def down
    drop_table :categories_posts
  end
end
