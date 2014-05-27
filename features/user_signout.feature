Feature: User signout
  In order to leave tower.im
  As a signined user
  I want to signout from tower.im

  Background:
    Given an existing user 'huaming' with email 'huaming.rao@gmail.com' and password '12345678'
    And has signined into tower.im


  @javascript
  Scenario: Huaming wants to sign out from tower.im
    Given I'm now staying on homepage
    When I press button 'signout'
    Then I should sign out and redirect to sign in page
