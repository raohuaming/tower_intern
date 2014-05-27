Feature: User login
  In order to try tower.im
  As a User
  I want to log into tower.im

  Background:
    Given an existing user 'huaming' with email 'huaming.rao@gmail.com' and password '12345678'

  Scenario: Huaming wants to log in using correct confidential
    Given I fill in email with 'huaming.rao@gmail.com'
    And fill in password with '12345678'
    When I press button "login"
    Then I should redirect to my homepage

  Scenario: Huaming wants to log in using incorrect confidential
    Given I fill in email with 'huaming.rao@gmail.com'
    And fill in password with '12345678'
    When I press button 'login'
    Then I should be notified with '密码错误，你还可以尝试4次'

  Scenario: One unregistered user wants to login using nonexisting account
    Given I fill in email with 'noregistered@gmail.com'
    And fill in password with '12345678'
    When I press button 'login'
    Then I should be notified with '该用户不存在'
