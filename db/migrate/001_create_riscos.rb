class CreateRiscos < ActiveRecord::Migration
  def change
    create_table :riscos do |t|
      t.string :titulo
      t.string :status
      t.text :descricao
      t.string :fonte
      t.string :categoria
      t.date :data_identificacao
      t.string :criado_por
      t.string :dono
      t.string :probabilidade
      t.string :impacto
      t.string :prioridade
      t.text :gatilho
      t.string :estrategia
      t.string :project_id
    end
  end
end
