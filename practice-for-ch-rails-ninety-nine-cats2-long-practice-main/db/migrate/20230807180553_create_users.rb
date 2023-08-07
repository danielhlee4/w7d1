class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: {unique: true}
      t.string :session_token, null: false
      t.timestamps
    end
      add_index :users, [:session_token, :username], unique: true
  end
end
