before '/survey' do
  if session[:email]
    redirect to '/survey/survey_temp'
  else
    redirect to '/logout'
  end

end


get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/survey/question_temp' do

  @question_val = Question.all.order(:id)
  erb :questions

end


get '/survey/survey_temp' do


  @surveys = Survey.all.order(:id)
  p @surveys
  erb :survey_index

end



get '/survey/temp_new_question' do

  erb :new_question

end

get '/survey/question/answer' do

  erb :new_answer

end




get '/survey/question/:question_id' do

  session[:question_id] = params[:question_id]
  @question = Question.find(session[:question_id])
  @answers = @question.answers

  erb :question_answer

end


get '/survey/question/me_disgusta/:question_id' do

  question_id = params[:question_id]
  @question = Question.find(question_id)
  @question.update(vote_dislike: (@question.vote_dislike + 1))
  @question_val = Question.all.order(:id)

  erb :questions

end


get '/survey/question/me_gusta/:question_id' do

  question_id = params[:question_id]
  @question = Question.find(question_id)
  @question.update(vote_like: (@question.vote_like + 1))
  @question_val = Question.all.order(:id)

  erb :questions

end

get '/survey/find_survey/:survey_id' do

  survey_id = params[:survey_id]
  @survey = Survey.find(survey_id)



  # @answer.update(vote_dislike: (@answer.vote_dislike + 1))
  # @answer_val = Answer.all.order(:id)

  # 
  # @question = Question.find(session[:question_id])
  # @answers = @question.answers

  erb :survey_values

end

get '/survey/answer/me_disgusta/:answer_id' do

  answer_id = params[:answer_id]
  @answer = Answer.find(answer_id)
  @answer.update(vote_dislike: (@answer.vote_dislike + 1))
  @answer_val = Answer.all.order(:id)

  
  @question = Question.find(session[:question_id])
  @answers = @question.answers

  erb :question_answer

end


get '/survey/answer/me_gusta/:answer_id' do

  answer_id = params[:answer_id]
  @answer = Answer.find(answer_id)
  @answer.update(vote_like: (@answer.vote_like + 1))
  @answer_val = Answer.all.order(:id)


  @question = Question.find(session[:question_id])
  @answers = @question.answers

  erb :question_answer

end

get "/survey/create" do
  erb :survey_question
end

post '/survey/question_answer_survey' do

  new_survey = URI.decode(params[:user_input].gsub("+"," "))
  p new_survey
  p new_survey = new_survey.split('&')

  cadena = new_survey.flatten

  cadena = cadena.split('&')
  cadena = cadena.flatten
  p cadena

  cadena.each do |value|
    p array_valor = value.split('=')
    p array_variable = array_valor[0].split('_') 
    p array_variable[1]
    if array_variable[1] == "question"
      p array_valor[1]
      @question = Question.create(question: array_valor[1])
      survey = Survey.find(session[:survey_id] )
      survey.questions << @question
  
    elsif array_variable[1] == "answer"
      p array_valor [1]
      answer = Answer.create(answer: array_valor[1])
      @question.answers << answer
  
    end

  end

p "*" * 100
# redirect to '/survey/survey_temp'

end



post '/survey/question' do

  new_survey = params[:new_survey]
  survey = Survey.create(survey: new_survey)
  session[:survey_id] = Survey.last.id
  user = User.find(session[:id])
  user.surveys << survey


  redirect to "/survey/create"
end



post '/survey/new_question' do

  question_val = params[:question_val]
  new_question = Question.create(question: question_val, vote_like: 0, vote_dislike: 0)
  @question_val = Question.all
  erb :questions

end

post '/survey/new_question' do

  question_val = params[:question_val]
  new_question = Question.create(question: question_val, vote_like: 0, vote_dislike: 0)
  @question_val = Question.all
  erb :questions

end


post '/survey/new_answer' do

  question_id = session[:question_id]
  answer_val = params[:answer_val]
  question = Question.find(session[:question_id])
  answer = Answer.create(answer: answer_val,  vote_like: 0, vote_dislike: 0)
  question.answers << answer
  redirect to "/survey/question/#{question_id}"

end





get '/salir' do

  erb :index

end