require 'sinatra'
require_relative './database.rb'

#to redirect all users to main page
get '/' do
    redirect to '/students'
end

#main page which will display all students
get '/students' do
   db = DBHandler.new
   @students = db.all
   #This will help me determine how to filter the students, default is all which is all students
   erb :application do
      erb :index 
   end
end

#this will display all students that have graduated
get '/students/g' do
   db = DBHandler.new
   @students = db.allg
   #This will help me determine how to filter the students, default is all which is all students
   erb :application do
      erb :index 
   end
end

#this is to display all students currently enrolled
get '/students/ce' do
   db = DBHandler.new
   @students = db.allce
   #This will help me determine how to filter the students, default is all which is all students
   erb :application do
      erb :index 
   end
end

#This is to get the form to create a new student
get '/students/new' do
   erb :application do
      erb :new 
   end
end

#This is to create a new student then go back to main page to see that they have been added
post '/students' do
   db = DBHandler.new
   db.create(params[:andrewid], params[:firstname], params[:lastname], params[:major], params[:email], params[:status])
   redirect to '/students'
end

#This one will get information on a specific student
get '/students/:andrewid' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   @student = db.get(andrewid)
   erb :application do
      erb :show 
   end
end

#this one will get the form to edit a specific student. It will get information on the student first.
get '/students/:andrewid/edit' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   @student = db.get(andrewid)
   erb :application do
      erb :edit 
   end
end

#This will update the information of the student
patch '/students/:andrewid' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   db.update(andrewid, params[:firstname], params[:lastname], params[:major], params[:email], params[:status])
   redirect to '/students'
end

#This will delete a student
get '/students/:andrewid/delete' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   db.destroy(andrewid)
   redirect to '/students'
end