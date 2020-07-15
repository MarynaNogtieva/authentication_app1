class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def up
    # 'after' option does not work for Postgres
    # https://dba.stackexchange.com/questions/3276/how-can-i-specify-the-position-for-a-new-column-in-postgresql
    add_column :users, :email, :string, null: false, after: :username
    add_index :users, :email,  name: 'users_email_index', unique: true
  end

  def down
    remove_index :users, name: 'users_email_index'
    remove_column :users, :email
  end
end
