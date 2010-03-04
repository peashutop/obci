class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string  :name_short
      t.text    :content
      t.integer :lft, :rgt, :parent_id #for awesome_nested_set
      t.integer :position #for acts_as_list
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
