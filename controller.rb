require 'sinatra'
require_relative './database.rb'

get '/' do
    redirect to '/students'
end

get '/students' do
   db = DBHandler.new
   @students = db.all
   #This will help me determine how to filter the students, default is all which is all students
   erb :application do
      erb :index 
   end
end

get '/students/g' do
   db = DBHandler.new
   @students = db.allg
   #This will help me determine how to filter the students, default is all which is all students
   erb :application do
      erb :index 
   end
end

get '/students/ce' do
   db = DBHandler.new
   @students = db.allce
   #This will help me determine how to filter the students, default is all which is all students
   erb :application do
      erb :index 
   end
end

get '/students/new' do
   erb :application do
      erb :new 
   end
end

post '/students' do
   db = DBHandler.new
   db.create(params[:andrewid], params[:firstname], params[:lastname], params[:major], params[:email], params[:status])
   redirect to '/students'
end

get '/students/:andrewid' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   @student = db.get(andrewid)
   erb :application do
      erb :show 
   end
end

get '/students/:andrewid/edit' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   @student = db.get(andrewid)
   erb :application do
      erb :edit 
   end
end

patch '/students/:andrewid' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   db.update(andrewid, params[:firstname], params[:lastname], params[:major], params[:email], params[:status])
   redirect to '/students'
end

get '/students/:andrewid/delete' do
   andrewid = params[:andrewid]
   db = DBHandler.new
   db.destroy(andrewid)
   redirect to '/students'
end