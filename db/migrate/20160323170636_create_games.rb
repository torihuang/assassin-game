class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string    :name
      t.string    :tagline
      t.string    :description
      t.string    :image_path
      t.string    :city
      t.string    :state

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
