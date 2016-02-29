class AddFieldsToNflSuspensions < ActiveRecord::Migration
  def change

    change_table :nfl_suspensions do |t|
      t.string :name
      t.string :team
      t.string :games
      t.string :category
      t.string :description
      t.string :year
      t.string :source
    end
  end
end
