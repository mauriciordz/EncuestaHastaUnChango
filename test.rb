cadena = "var_question_1=Q1&var_answer_1=A1&var_answer_2=A2&var_answer_3=A3&var_question_2=Q2&var_answer_1=A1&var_answer_2=A2"

cadena = cadena.split('&')
# p cadena

cadena.each do |value|
 p array_valor = value.split('=')
 p array_variable = array_valor[0].split('_') 
 p array_variable[1]
  if array_variable[1] == "question"
    p array_valor[1]
    # question = Question.create(question: array_valor[1])
    # user = User.find(session[:id])
    # user.questions << question

  elsif array_variable[1] == "answer"
    p array_valor [1]
    # answer = Answer.create(answer: array_valor[1])
    # question.answers << answer

  end
    

end