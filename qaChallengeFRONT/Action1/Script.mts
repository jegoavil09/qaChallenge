Browser("Challenge QA").Navigate "http://localhost:4000/register"
Browser("Challenge QA").Page("Challenge QA").WebEdit("Txt_email").Set "correo1@gmail.com"
Browser("Challenge QA").Page("Challenge QA").WebEdit("Txt_password").SetSecure "6297acadfc8074c6fdeb079a6ccef5259351c9717131"
Browser("Challenge QA").Page("Challenge QA").WebButton("Btn_Register").Click
