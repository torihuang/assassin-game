class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string    :name, null: false
      t.string    :tagline
      t.string    :description, null: false
      t.string    :image_path
      t.string    :city, null: false
      t.string    :state, null: false

      t.datetime  :start_date
      t.datetime  :end_date

      # scheduled, active, completed, aborted
      t.string    :status

      t.integer   :winner_id
      t.integer   :creator_id

      t.timestamps(null: false)
    end
  end
end
