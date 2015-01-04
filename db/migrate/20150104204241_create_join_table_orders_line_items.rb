class CreateJoinTableOrdersLineItems < ActiveRecord::Migration
  def change
    create_join_table :orders, :line_items do |t|
       t.index [:order_id, :line_item_id]
       t.index [:line_item_id, :order_id]
    end
  end
end
