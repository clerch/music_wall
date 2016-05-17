class AddUsersUpvotes < ActiveRecord::Migration
  
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.timestamps null: false
    end

    create_table :upvotes do |t|
      t.references :user, index: true
      t.integer :track_id
      t.timestamps null: false
    end
    
    change_table :tracks  do |t|
    t.references :user, index: true
    end
  end
end
