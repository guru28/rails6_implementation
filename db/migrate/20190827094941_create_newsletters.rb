class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters do |t|
    	t.string :subject
    	t.string :from_address

      t.timestamps
    end
  end
end
