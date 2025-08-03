Feature: Create A Booking

  Background:
    Given url baseUrl

  @Regression
  Scenario: Create a booking for user
    * def dataBody =
    """{
    "firstname": "Jim",
    "lastname": "Brown",
    "totalprice": 111,
    "depositpaid": true,
    "bookingdates": {
    "checkin": "2018-01-01",
    "checkout": "2019-01-01"
    },
    "additionalneeds": "Breakfast"
    }
    """
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request dataBody
    When method POST
    Then status 200


  @Smoke
  Scenario: Create a booking for user
    And print text
    * def dataBody = read('../payloads/createBooking.json')
    * def randomNumber = Java.type("utils.RandomDataGenerator")
    * def randomNum = randomNumber.generateRandomId();
    * set dataBody.totalprice = randomNum;
    And print dataBody
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request dataBody
    When method POST
    Then status 200

  @Smoke
  Scenario: Create a booking for user details
    * def name = "Amit"
    * def id = 13
    * def isBooked = true
    * def bookedUser = {name: '#(name)', id: '#(id)', isBooked: '#(isBooked)'}
    * print bookedUser
    * print `${name}`
