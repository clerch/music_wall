class Addcolumnupvotestotracks < ActiveRecord::Migration
  def change
    change_table :tracks  do |t|
      t.integer :upvote_count
    end
  end
end
