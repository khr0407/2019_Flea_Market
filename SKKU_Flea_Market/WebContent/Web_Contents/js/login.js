const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

function validate_signup(){
	var studentID = document.forms['signup']['studentID'].value;
	var password = document.forms['signup']['password'].value;
	var name = document.forms['signup']['name'].value;
	var checkbox = document.forms['signup']['signup_class'];
	// checkbox 값 가져오기 안했음.

	if(studentID=="")
		alert("Please enter your Student ID!");
	else if(password=="")
		alert("Please enter your password!");
	else if(name=="")
		alert("Please enter your name!");
	//else if(checkbox 체크 안되어있음)
	else
	{
		// 데이터베이스에 정보저장
		return true;
	}
	return false;
}

function validate_signin(){
	var studentID = document.forms['signin']['studentID'].value;
	var password = document.forms['signin']['password'].value;
	var radiobutton = document.forms['signin']['signin_class'];

	// radiobutton 값 가져오기 안했음.

	if(studentID=="")
		alert("Please enter your Student ID!");
	else if(password=="")
		alert("Please enter your password!");
	else
	{
		// 데이터베이스 정보와 비교
		return true;
	}
	return false;
}
