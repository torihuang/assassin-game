class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer   :user_id
      t.integer   :game_id
      t.integer   :target_id
      t.boolean   :target_alive?
      t.boolean   :alive?

      t.timestamps(null: false)
    end
  end
end
