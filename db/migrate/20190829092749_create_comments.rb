class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
    	t.text :body
    	t.references :subcriber
    	t.references :newsletter

      t.timestamps
    end
  end
end
