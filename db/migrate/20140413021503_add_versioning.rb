class AddVersioning < ActiveRecord::Migration
  def up
  	Risco.create_versioned_table
  end

  def down
  	Risco.drop_versioned_table
  end
end
