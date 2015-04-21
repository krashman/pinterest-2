class Pins < ActiveRecord::Migration
  def change
  	create_table :pins do |t|
  		t.string :title
  		t.text :description

  		t.timestamp null: false
  	end
  end
end
