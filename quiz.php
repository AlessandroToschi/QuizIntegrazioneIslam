<html>
<head>
	<meta charset="utf-8">
	<title>Quiz Integrazione Islam</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="/quizScript.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container center-block">
		<br>
		<form role="form" method="post" action="/quiz.php" onsubmit="return checkForm();">
			<?php
			#Connessione al database.
			#IP: localhost.
			#User: aleto.
			#Password: toscolino.
			#Nome del database: "QuizIntegrazioneIslam".
			$dbConnection = mysqli_connect('127.0.0.1', 'aleto', 'toscolino', 'QuizIntegrazioneIslam');
			mysqli_set_charset($dbConnection, 'utf8');

			#Se non sono riuscito a connetermi:
			if(!$dbConnection)
			{
				#Visualizzo l'errore e termino l'esecuzione.
				die("Connection failed:" . mysqli_connect_error());
			}



			#Variabile che memorizza se questa pagina sia stata chiamata da una POST,
			#in tal caso mi serve sapere se devo visualizzare le risposte corrette al quiz.
			$showCorrectAnswers = False;

			#Se la pagina è stata impostata nel POST la variabile "showCorrectAnswers":
			if(isset($_POST['showCorrectAnswers']))
			{
				#Imposto showCorrectAnswers al valore passato nel POST.
				#Puo' essere true se risulta da una chiamata da un quiz fatto.
				#Risulta essere false se viene fatta da una seconda POST, quando erano già state visualizzate le risposte corrette.
				$showCorrectAnswers = $_POST['showCorrectAnswers'];
				
				foreach (array_keys($_POST) as $IDQuestion) 
				{
					if($IDQuestion != 'showCorrectAnswers')
					{
						$IDAnswer = str_replace('A','',$_POST[$IDQuestion]);
						$answerChosenCountUpdateQuery = "UPDATE Answers SET ChosenCount = ChosenCount + 1 WHERE IDAnswer=$IDAnswer";
						#mysqli_query($dbConnection, $answerChosenCountUpdateQuery);
					}
				}
			}

			#Query SQL per le domande del quiz.
			$questionsQuery = 'SELECT * FROM Questions;';
			#QueryResult contenente il record set della query.
			$questionsQueryResult = mysqli_query($dbConnection, $questionsQuery) or die("Impossible to retrieve questions.");
			#Memorizzo le domande del quiz.
			$questions = [];
			while($r = $questionsQueryResult->fetch_array(MYSQLI_NUM))
			{
				$questions[] = $r;
			}
			mysqli_free_result($questionsQueryResult);#Libero lo spazio del record set.

			#Array contenente le risposte alle domande del quiz.
			$answers = array();
			$questionsCount = 1;

			#Per ogni domanda:
			foreach($questions as $question)
			{
				echo "<div class='form-group'><div id="."'Q$question[0]'"." class='well'>";
				echo "<label class='control-label' for='Q$question[0]'>".$question[1]."</label>";

				if($showCorrectAnswers == True)
				{

					#SELECT CorrectAnswers.IDQuestion, CorrectAnswers.Description, Answers.Description  FROM CorrectAnswers INNER JOIN Answers ON CorrectAnswers.IDAnswer = Answers.IDAnswer WHERE CorrectAnswers.IDQuestion=1;
					#Query SQL per le risposte corrette.
					$correctAnswerQuery = 'SELECT CorrectAnswers.IDQuestion, CorrectAnswers.Description, Answers.Description ';
					$correctAnswerQuery .= "FROM CorrectAnswers INNER JOIN Answers ON CorrectAnswers.IDAnswer = Answers.IDAnswer ";
					$correctAnswerQuery .= "WHERE CorrectAnswers.IDQuestion=$question[0];";
					#QueryResult contenente il record set della query.
					$correctAnswerQueyResult = mysqli_query($dbConnection, $correctAnswerQuery);
					#Memorizzo le risposte corrette.
					$correctAnswer = $correctAnswerQueyResult->fetch_array(MYSQLI_NUM);

					echo "<br><p>La risposta corretta era: '".$correctAnswer[2]."'</p>";
					echo "<br><p>$correctAnswer[1]</p>";

					mysqli_free_result($correctAnswerQueyResult);#Libero lo spazio del record set.
				}
				else
				{
					#Query SQL per le risposte alla relativa domanda.
					$answersQuery = "SELECT * FROM Answers WHERE IDQuestion=$question[0];";
					#QueryResult contenente il record set della query.
					$answersQueryResult = mysqli_query($dbConnection, $answersQuery);
					#Aggiungo le risposte relative alla domanda all'array delle risposte.
					#$answers = array_merge($answers, $answerQueryResult->fetch_all());

					$answers = [];
					while($r = $answersQueryResult->fetch_array(MYSQLI_NUM))
					{
						$answers[] = $r;
					}
					foreach($answers as $answer)
					{
						#$ss = htmlspecialchars(utf8_encode($answer[1]));
						$ss = $answer[1];
						echo "<div class='radio'><label><input name='Q$question[0]' type='radio' required value='A$answer[0]'>$ss</label></div>";
						$answersCount += 1;
					}

					mysqli_free_result($answersQueryResult);#Libero lo spazio del record set.
				}

				echo "</div></div><br>";

				$questionsCount += 1;
			}

			if($showCorrectAnswers == True)
			{
				echo "<a class='center-block' href='/quiz.php'><button type='button' class='btn btn-default center-block'>Torna al quiz</button></a>";
				echo "<input name='showCorrectAnswers' value='False' hidden>";
			}
			else
			{
				echo "<button type='submit' class='btn btn-default center-block'>Verifica risultati</button>";
				echo "<input name='showCorrectAnswers' value='True' hidden>";
			}
			#Chiudo la connessione al database.
			mysqli_close($dbConnection);
			?>
			<br>
		</form>
	</div>
</body>
</html>
