class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :nickname
      t.string    :email
      t.string    :phone
      t.string    :phone_allowed?, default: "no"
      t.string    :image_path
      t.string    :bio
      t.string    :password_hash
      t.integer   :kill_count
      t.integer   :game_count
      t.integer   :win_count

      t.timestamps(null: false)
    end
  end
end
