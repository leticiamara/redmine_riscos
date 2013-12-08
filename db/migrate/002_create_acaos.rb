class CreateAcaos < ActiveRecord::Migration
  def change
    create_table :acaos do |t|
      t.string :tipo
      t.string :titulo
      t.text :descricao
      t.string :atribuido_para
      t.date :prazo
      t.date :data_de_conclusao
      t.integer :risco_id
    end
  end
end
