require 'sqlite3'
require 'json'

class User
  attr_accessor :name, :surname, :email, :password, :profession,:db

  def initilaize()
    self.db = SQLite3::Database.open 'users.db'
    self.db.execute 'Create table if not exists users(
      id integer not null primary key autoincrement,
      name varchar(255),
      surname varchar(255),
      email varchar(255),
      password varchar(255),
      profession varchar(255)
    )'
  end

  def insert(user)
    begin
      self.db.execute 'insert into users("name","surname","email","password","profession")
                       values(#{user.name}, #{user.surname},#{user.email}, #{self.password}, #{self.profession})'
      200
    rescue
      400
    end
  end

  def get_by_email(email)
    begin
      res = self.db.execute 'select name,surname,email,password,profession from users where email="#{email}"'
      puts res
      ans = {'name' => res[0],
           'surname' => res[1],
           'email' => res[2],
           'password' => res[3],
           'profession' => res[4],
           'status' => 200
          }
      ans.to_json
    rescue
      {'status'=>404}
    end
  end

end
