class CreateBblogs < ActiveRecord::Migration[7.0]
  def change
    create_table :bblogs do |t|
      t.text :custom_domain
      t.string :title
      t.string :theme

      t.timestamps
    end
  end
end
