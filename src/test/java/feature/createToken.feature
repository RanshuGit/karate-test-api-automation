@Regression
@Smoke
Feature: Create Auth Token

  Scenario: Create Auth token
    Given url 'https://restful-booker.herokuapp.com/auth'
    And header Content-Type = 'application/json'
    * def data =
    """
    {
    "username" : "admin",
    "password" : "password123"
    }
    """
    And request data
    When method POST
    Then status 200
    * def token = response.token
    And print response.token
