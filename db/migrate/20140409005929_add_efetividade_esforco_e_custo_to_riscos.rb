class AddEfetividadeEsforcoECustoToRiscos < ActiveRecord::Migration
  def change
    add_column :riscos, :efetivo, :boolean
    add_column :riscos, :esforco, :time
    add_column :riscos, :custo, :float
  end
end
