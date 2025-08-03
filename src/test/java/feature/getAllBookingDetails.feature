Feature: Get Booking Details

  Background:
    Given url baseUrl

  @Regression
  Scenario: Get All Booking Ids
    When method GET
    Then status 200
    And print response

  Scenario: Get Booking Ids with parameters
    And param firstname = 'Jim'
    And param lastname = 'Brown'
    When method GET
    Then status 200
    And print response

  Scenario: Get Booking Ids with date
    And param checkin = '2025-03-13'
    And param checkout = '2025-05-21'
    When method GET
    Then status 200
    And print response