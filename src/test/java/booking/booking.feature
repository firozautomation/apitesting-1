Feature: booking testing
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario: get booking for existing user
    Given url 'http://127.0.0.1:8900/booking?id=pepe%40pepe.pe1-0.1'
    When method get
    Then status 200


  Scenario: create a booking
    * def booking =
      """
      {
        "date": "2020-01-08",
        "destination": "BER",
        "id": "pepe@pepe.pe1-0.1",
        "origin": "MAD"
      }
      """

    Given url 'http://127.0.0.1:8900/booking'
    And request booking
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

  Scenario: get booking for existing user
    Given url 'http://127.0.0.1:8900/booking?id=pepe%40pepe.pe1-0.1'
    When method get
    Then status 200