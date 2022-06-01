Feature: Microservicio qaChallenge
  
  Background:
    * url BaseUrl
		* header Accept = 'application/json'

  @Test1
  Scenario Outline: 'CP001: 1.	Verificar que al enviar el campo email con @ en el registro se debe obtener code 201 y msg SAVED.'
    								
    Given path '/register'
    And request 
    """
    { 
    	"email":"correo1@gmail.com",
		  "password":"123456"	
		}
		"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "SAVED"
		
		Examples:
		| read('Authentication.csv') |	
		
	@Test2
  Scenario Outline: 'CP002: 2.	Verificar que al enviar el campo “email” sin @ en el registro se debe obtener statusCode 422, code 998 y msg “INVALID”.'
    Given path '/register'
    And request 
    """ 
    {
		    "email":"correo1gmail.com",
		    "password":"123456"
	  }
	  """
		When method POST
    Then status 422
    And match $.code == 998
    And match $.msg == "INVALID"
		
		Examples:
		| read('Authentication.csv') |
	
	@Test3
  Scenario Outline: 'CP003: 3.	Verificar que al enviar el campo “email” con @ en el login se debe obtener code 201 y msg “LOGIN VALID”.'
    Given path '/login'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123456"
		}
		"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "LOGIN VALID"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test4
  Scenario Outline: 'CP004: 4.	Verificar que al enviar el campo “email” sin @ en el login se debe obtener statusCode 401, code 997 y msg “INVALID”.'
    Given path '/login'
    And request 
    """
    {
		    "email":"correo1gmail.com",
		    "password":"123456"
		}
		"""
		When method POST
    Then status 401
    And match $.code == 997
    And match $.msg == "INVALID"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test5
  Scenario Outline: 'CP005: 5.	Verificar que al enviar el campo obligatorio “email” en el registro se obtenga code 201 y msg “SAVED”.'
    Given path '/register'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123456"
		}
		"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "SAVED"
    
    Examples:
		| read('Authentication.csv') |
		
	@Test6
  Scenario Outline: 'CP006: 6.	Verificar que al no enviar el campo obligatorio “email” en el registro se obtenga statusCode 422, code 999 y msg “REQUIRED”.'
    Given path '/register'
    And request 
    """
    {
	    "email":"",
	    "password":"123456"
		}
		"""
    When method POST
    Then status 422
    And match $.code == 999
    And match $.msg == "REQUIRED"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test7
  Scenario Outline: 'CP007: 7.	Verificar que al enviar el campo obligatorio “email” en el login se obtenga code 201 y msg “LOGIN VALID”.'
    Given path '/login'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123456"
  	}
  	"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "LOGIN VALID"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test8
  Scenario Outline: 'CP008: 8.	Verificar que al no enviar el campo obligatorio “email” en el login se obtenga un statusCode 422, code 999 y msg “REQUIRED”.'
    Given path '/login'
    And request 
    """
    {
		    "email":"",
		    "password":"123456"
		}
		"""
    When method POST
    Then status 422
    And match $.code == 999
    And match $.msg == "REQUIRED"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test9
  Scenario Outline: 'CP009: 9.	Verificar que al enviar el campo obligatorio “password” en el registro se obtenga code 201 y msg “SAVED”.'
    Given path '/register'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123456"
		}
		"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "SAVED"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test10
  Scenario Outline: 'CP010: 10.	Verificar que al no enviar el campo obligatorio “password” en el registro se obtenga statusCode 422, code 999 y msg “REQUIRED”.'
    Given path '/register'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":""
		}
		"""
		When method POST
    Then status 422
    And match $.code == 999
    And match $.msg == "REQUIRED"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test11
  Scenario Outline: 'CP011: 11.	Verificar que al enviar el campo obligatorio “password” en el login se obtenga code 201 y msg “LOGIN VALID”.'
    Given path '/login'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123456"
		}
		"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "LOGIN VALID"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test12
  Scenario Outline: 'CP012: 12.	Verificar que al no enviar el campo obligatorio “password” en el login se obtenga statusCode 422, code 999 y msg “REQUIRED”.'
    Given path '/login'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":""
		}
		"""
    When method POST
    Then status 422
    And match $.code == 999
    And match $.msg == "REQUIRED"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test13
  Scenario Outline: 'CP013: 13.	Verificar que al enviar el campo “password” con una cantidad de caracteres mayor o igual a 5 en el registro se obtenga code 201 y msg “SAVED”.'
    Given path '/register'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123456"
		}
		"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "SAVED"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test14
  Scenario Outline: 'CP014: 14.	Verificar que al enviar el campo “password” con una cantidad de caracteres menor a 5 en el registro se obtenga statusCode 422, code 998 y msg “INVALID”.'
    Given path '/register'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123"
		}
		"""
		When method POST
    Then status 422
    And match $.code == 998
    And match $.msg == "INVALID"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test15
  Scenario Outline: 'CP015: 15.	Verificar que al enviar el campo “password” con una cantidad de caracteres mayor o igual a 5 en el login se obtenga code 201 y msg “LOGIN VALID”.'
    Given path '/login'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123456"
		}
		"""
		When method POST
    Then status 200
    And match $.code == 201
    And match $.msg == "LOGIN VALID"
		
		Examples:
		| read('Authentication.csv') |
		
	@Test16
  Scenario Outline: 'CP016: 16.	Verificar que al enviar el campo “password” con una cantidad de caracteres menor a 5 en el login se obtenga statusCode 422, code 998 y msg “INVALID”.'
    Given path '/login'
    And request 
    """
    {
	    "email":"correo1@gmail.com",
	    "password":"123"
		}
		"""
		When method POST
    Then status 401
    And match $.code == 997
    And match $.msg == "INVALID"
		
		Examples:
		| read('Authentication.csv') |
		