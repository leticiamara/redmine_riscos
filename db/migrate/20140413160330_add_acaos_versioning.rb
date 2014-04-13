class AddAcaosVersioning < ActiveRecord::Migration
  def up
  	Acao.create_versioned_table
  end

  def down
  	Acao.drop_versioned_table
  end
end
