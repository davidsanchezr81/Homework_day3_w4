require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student')


get '/student' do
  @grades = Student.all()
  erb(:index)
end

post '/student' do
  @order = PizzaOrder.new( params )
  @order.save()
  erb(:create) #create es el confirmation page por haber comprado la pizza
end
