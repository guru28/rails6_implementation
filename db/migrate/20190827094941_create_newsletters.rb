class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters do |t|
    	t.string :subject
    	t.text   :content

      t.timestamps
    end
  end
end
