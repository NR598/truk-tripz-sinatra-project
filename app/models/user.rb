class User < ActiveRecord::Base
  has_secure_password
  has_many :loads
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
