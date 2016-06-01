function checkForm()
{
	var notCheckedCount = 0;
	
	for(var questionsCount = 1; questionsCount <= 10; questionsCount++)
	{
		var questionGroup = document.getElementById("Q" + questionsCount); 
		var oldAlertElementIndex = -1;
		var radioButtons = document.getElementsByName("Q" + questionsCount);
		var hasChecked = false;
		
		for(var i = 0; i < questionGroup.childElementCount; i++)
		{
			if(questionGroup.children[i].className == "alert alert-danger")
			{
				oldAlertElementIndex = i; 
			}
		}
		
		if(oldAlertElementIndex != -1)
		{
			questionGroup.removeChild(questionGroup.children[oldAlertElementIndex]);
		}
				
		for(var i = 0; i < radioButtons.length; i++)
		{
			if(radioButtons[i].checked)
			{
				hasChecked = true;
			}
		}
		
		if(!hasChecked)
		{
			notCheckedCount++;

			var alert = document.createElement("div");
			alert.className = "alert alert-danger";
			alert.innerHTML = "Attenzione! Risposta mancante, inserirla prima di verificare i risultati."
			questionGroup.appendChild(alert);
		}
	}

	return notCheckedCount == 0;
}