class AddOriginFieldToRiscos < ActiveRecord::Migration
  def change
    add_column :riscos, :origem, :string
  end
end
