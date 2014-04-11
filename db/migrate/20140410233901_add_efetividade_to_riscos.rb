class AddEfetividadeToRiscos < ActiveRecord::Migration
  def change
    add_column :riscos, :efetivo, :boolean
  end
end
