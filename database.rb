require 'sqlite3'

class DBHandler
   def initialize
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "CREATE TABLE IF NOT EXISTS students (AndrewID TEXT PRIMARY KEY, FirstName TEXT, LastName TEXT, Major TEXT, Email TEXT, Status TEXT);"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end
   
   def create(andrewid, firstname, lastname, major, email, status)
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "INSERT INTO students VALUES('#{andrewid}', '#{firstname}', '#{lastname}', '#{major}', '#{email}', '#{status}');"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   def all
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "SELECT AndrewID, FirstName, LastName, Status FROM students;"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   def get(andrewid)
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "SELECT * FROM students WHERE AndrewID='#{andrewid}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end    
  
   def update(andrewid, firstname, lastname, major, email, status)
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "UPDATE students SET FirstName='#{firstname}', LastName='#{lastname}', Major='#{major}', Email='#{email}', Status='#{status}' WHERE AndrewID='#{andrewid}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   def destroy(andrewid)
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "DELETE FROM students WHERE AndrewID='#{andrewid}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end    
   
end