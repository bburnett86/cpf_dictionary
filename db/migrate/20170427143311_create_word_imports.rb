class CreateWordImports < ActiveRecord::Migration[5.0]
  def change
    create_table :word_imports do |t|

      t.timestamps
    end
  end
end
