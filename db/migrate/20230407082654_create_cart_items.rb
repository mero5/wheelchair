class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer   :category_id,     :null => false
      t.string    :name,         :null => false
      t.text      :introduction, :null => false
      t.integer   :price,        :null => false
      t.boolean   :is_active,    :null => false,  default: true

      t.timestamps
    end
  end
end
