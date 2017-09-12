class AddMoreColumnsToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|

      t.text     "content"
      t.datetime "scheduled_at"
      t.string   "state"
      t.integer  "user_id"
      t.boolean  "facebook"
      t.boolean  "twitter"

    end

  end
end
