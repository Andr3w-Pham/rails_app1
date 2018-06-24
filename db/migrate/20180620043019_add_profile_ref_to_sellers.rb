class AddProfileRefToSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :sellers, :profile, foreign_key: true
  end
end
