class AddInfoContributors < ActiveRecord::Migration[6.1]
  def change
    add_column :contributors, :uid, :string
    add_column :contributors, :provider, :string
  end
end
