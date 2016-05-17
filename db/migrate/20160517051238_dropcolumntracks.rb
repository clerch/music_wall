class Dropcolumntracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :upvote_count
  end
end
