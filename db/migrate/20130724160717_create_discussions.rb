class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :question
      t.timestamp :time

      t.timestamps
    end
  end
end
