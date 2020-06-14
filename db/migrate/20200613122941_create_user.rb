class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :extra1, comment: "アプリ固有情報1"
    end
  end
end
