Feature: Get Booking Details using Id

  @Smoke
  Scenario Outline: Get Booking by Id
    Given url baseUrl
    And path <Id>
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And assert responseStatus == 200
    * match responseStatus == 200
    * print response
    * print 'Status Code:', responseStatus
    * match response == {"firstname":"John","lastname":"Smith","totalprice":111,"depositpaid":true,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    * match $.firstname == "John"
    * print response.firstname
    * print responseHeaders['Content-Type']
    * match header Content-Type contains "application/json"

    Examples:
      | Id  |
      | 267 |
