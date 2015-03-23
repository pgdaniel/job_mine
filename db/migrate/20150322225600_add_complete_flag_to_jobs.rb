class AddCompleteFlagToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :complete, :boolean
  end
end
