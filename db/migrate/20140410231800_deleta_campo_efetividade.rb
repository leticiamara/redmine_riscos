class DeletaCampoEfetividade < ActiveRecord::Migration
  def up
  	remove_column :riscos, :efetivo
  end

  def down
  end
end
