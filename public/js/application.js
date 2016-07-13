$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 

  //create three initial fields
    


//create three initial fields
var startingNo = 0;
var $node = "";
var startingNoAnswer = 0;
var displayCountAnswer = 0; 
for(varCount=0;varCount<=startingNo;varCount++){
    var displayCount = varCount+1;
    $node += '<p><label for="var'+displayCount+'">Question '+displayCount+': </label><input type="text" name="var_question_'+displayCount+'" id="var_question_'+displayCount+'"><span class="removeVar">Add Answer</span></p>';
}
//add them to the DOM
$('#form_questions').prepend($node);
//remove a textfield
$('#form_questions').on('click', '.removeVar', function(){
      
      var $node_answer = "";
      
      displayCountAnswer = displayCountAnswer + 1;
      $node_answer += '<p><label for="var'+displayCountAnswer+'">&nbsp; &nbsp; &nbsp; &nbsp; Answer '+displayCountAnswer+': </label><input type="text" name="var_answer_'+displayCountAnswer+'" id="var_Answer_'+displayCountAnswer+'">';
      
      $(this).parent().append($node_answer);
});
//add a new node
$('#addVar').on('click', function(){
varCount++;
$node = '<p><label for="var'+varCount+'">Question '+varCount+': </label><input type="text" name="var_question_'+varCount+'" id="var_question_'+varCount+'"><span class="removeVar">Add Answer</span></p>';
$(this).parent().before($node);
displayCountAnswer = 0; 
});


  $( "#form_questions" ).on( "submit", function( event ) {
    event.preventDefault();
    value_form =  $( this ).serialize();
  
    console.log(value_form)
    

    $.post('/survey/question_answer_survey',{user_input: value_form}, function(data){
      // console.log(data);
      // $.get('/survey/survey_temp');
      window.location.replace("/survey/survey_temp");
    });
  
  });

});
