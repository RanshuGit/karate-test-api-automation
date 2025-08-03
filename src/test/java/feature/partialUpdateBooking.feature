@Regression
Feature: Update Booking Partially

  Scenario Outline: Update Firstname, Lastname and total price using csv
    Given url baseUrl
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = `token=${authToken}`
    * print 'Auth Token: ', authToken
    * def csvData =
    """
    {
    "firstname": ##(first_name),
    "lastname": "<last_name>"
    }
    """
    * def randomNumber = Java.type('utils.RandomDataGenerator')
    And path randomNumber.generateRandomId()
    And request csvData
    And retry until responseStatus == 200
    When method PATCH
    Then status 200
    * print response

    Examples:
    |read('../payloads/mockData.csv')|