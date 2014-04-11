class AddEfetividadeToAcaos < ActiveRecord::Migration
  def change
    add_column :acaos, :efetivo, :boolean
  end
end
