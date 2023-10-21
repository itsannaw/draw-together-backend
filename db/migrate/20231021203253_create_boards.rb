class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.json :snapshot

      t.timestamps
    end
    add_index :boards, :name, unique: true
  end
end
