class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :type
    	t.integer :number
    	t.integer :ccv
    	t.string :fname
    	t.string :lname
     	t.string :user_id
      	t.timestamps
    end
  end
end
