package liftbot;

import javax.swing.JTextField;


/* Define the validation to make sure that text fields are filled out. */
public class Validations {
	public static int isEmpty(JTextField textInput){
		if (textInput.getText().length() == 0){
			return 1;
		}
		else{
			return 0;
		}
		
	}
}
