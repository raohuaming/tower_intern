Feature: User signin
  In order to try tower.im
  As a User
  I want to log into tower.im

  Background:
    Given an existing user 'huaming' with email 'huaming.rao@gmail.com' and password '12345678'

  @javascript
  Scenario: Huaming wants to log in using correct confidential
    Given I have accessed signin page
    And fill in email with 'huaming.rao@gmail.com'
    And fill in password with '12345678'
    When I press button "signin"
    Then I should redirect to my homepage

  @javascript
  Scenario: Huaming wants to log in using incorrect confidential
    Given I have accessed signin page
    And fill in email with 'huaming.rao@gmail.com'
    And fill in password with 'wrongpassword'
    When I press button "signin"
    Then I should be notified with '密码错误'
