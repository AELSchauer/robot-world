require 'sqlite3'

class Robot

  def initialize(robot_params)
    @database   = Robot.database
    @id         = robot_params["id"]
    @name       = robot_params["name"]
    @city       = robot_params["city"]
    @state      = robot_params["state"]
    @department = robot_params["department"]
  end

  def self.database
    database = SQLite3::Database.new('db/robot_world.db')
    database.results_as_hash = true
    database
  end

  def self.all
    database
    database.execute("SELECT * FROM robots")
  end

end
