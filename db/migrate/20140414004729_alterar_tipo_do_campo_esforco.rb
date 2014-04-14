class AlterarTipoDoCampoEsforco < ActiveRecord::Migration
  def up
  	change_column :riscos, :esforco, :float
  end

  def down
  end
end
