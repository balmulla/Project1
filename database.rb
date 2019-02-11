#this file will contain methods to communicate with the database
require 'sqlite3'

class DBHandler
  #This will make sure the table students exists
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
   
   #This will create a new student
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
   
   #this method will select all the students in the students table in the students database
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

#This method will select all the students that graduated
   def allg
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "SELECT AndrewID, FirstName, LastName, Status FROM students WHERE Status = 'Graduated';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   

#This method will select all students that are currently enrolled
   def allce
      begin
        db = SQLite3::Database.open "students.db"
        dbstatement = "SELECT AndrewID, FirstName, LastName, Status FROM students WHERE Status = 'Currently Enrolled';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   

#This method will git the whole profile of one specific student   
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

#this method will update a student's record  
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

#this method will delete a student   
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