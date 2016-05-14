class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :tipo
      t.string :salario

      t.timestamps null: false
    end
  end
end
