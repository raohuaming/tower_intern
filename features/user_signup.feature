Feature: User signup
  In order to try become members of tower.im
  As a new user
  I want to sign up a new account

  Background: 
    Given an existing user 'huaming' with email 'huaming.rao@gmail.com' and password '12345678'

  @javascript
  Scenario: Sam wants to register a new account
    Given I have accessed signup page
    And fill in name with 'sam'
    And fill in email with 'sam@test.com'
    And fill in password with '12345678'
    When I press button 'signup'
    Then I should successfully register a new account

  @javascript
  Scenario: Sam wants to register a new account but with a registered email
    Given I have accessed signup page
    And fill in name with 'huaming'
    And fill in email with 'huaming.rao@gmail.com'
    And fill in password with '12345678'
    When I press button 'signup'
    Then I should be notified with '该账号已存在，请直接登录后创建新团队'

