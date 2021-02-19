require 'pry'
require 'httparty'
require 'sqlite3'
require 'tty-font'

require_relative('../lib/cli')
require_relative('../lib/etherscan')
require_relative('../lib/addresses')

DB = {conn: SQLite3::Database.new("db/user.db")}
