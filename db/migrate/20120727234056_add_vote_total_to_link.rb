class AddVoteTotalToLink < ActiveRecord::Migration
  def change
    add_column :links, :vote_total, :integer, :default => 0
  end
end
