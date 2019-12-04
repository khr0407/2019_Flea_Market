const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const dup_button = document.getElementById('dup_button');
const dup_text = document.getElementById('dup_text');

var checkDuplicate = false;
var isDuplicate = true;

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

dup_button.addEventListener('click', () => {
	checkDuplicate = true;
	// ID 중복체크
	/*
	if()
	{
		dup_text.innerHTML = "This ID is already in use."
		dup_text.style.color = 'red';
	}

	else*/

	{
		dup_text.innerHTML = "This ID is available."
		dup_text.style.color = 'blue';
		isDuplicate = false;
		document.getElementById('signup_ID').disabled = true;
		document.getElementById('signup_ID').style.background = '#b7b7b7';
		dup_button.disabled = true;
	}
});

function validate_signup(){
	var studentID = document.forms['signup']['studentID'].value;
	var password = document.forms['signup']['password'].value;
	var name = document.forms['signup']['name'].value;
	var signup_class = ""

	// checkbox 값 가져오기
	var checkbox = document.getElementById("class_checkbox");
	var checkbox_elements = checkbox.getElementsByTagName('input');
	for(var i=0; i<2; i++)
	{
		if(checkbox_elements[i].checked)
			signup_class += checkbox_elements[i].value;
	}

	// 중복, 빈칸 확인
	if(studentID=="")
		alert("Please enter your Student ID!");
	else if(checkDuplicate==false)
		alert("Please click ID check button!");
	else if(isDuplicate==true)
		alert("Please enter valid Student ID!");
	else if(password=="")
		alert("Please enter your password!");
	else if(name=="")
		alert("Please enter your name!");
	else if(signup_class=="")
		alert("Please check your user type!");
	else
	{
		// 데이터베이스 정보와 비교
		return true;
	}
	return false;

}

function validate_signin(){
	var studentID = document.forms['signin']['studentID'].value;
	var password = document.forms['signin']['password'].value;
	var radiobutton = document.forms['signin']['signin_class'];
	var signin_class = ""

	// radiobutton 값 가져오기
	var radiobutton = document.getElementById("class_radiobutton");
	var radiobutton_elements = radiobutton.getElementsByTagName('input');
	for(var i=0; i<3; i++)
	{
		if(radiobutton_elements[i].checked)
			signin_class = radiobutton_elements[i].value;
	}

	// 빈칸 확인
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
