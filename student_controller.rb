require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student')


get '/student' do
  @grades = Student.all()
  erb(:index)
end

post '/student' do
  @grades = Student.new( params )
  @grades.save()
  erb(:create) #create es el confirmation page por haber comprado la pizza
end

get '/student/new' do # esto solo te abre (render) el website del form para rellenar
  erb(:new)
end
