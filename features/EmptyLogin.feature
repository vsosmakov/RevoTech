@LoginTest
Feature: Revo Technology

@EmptyLogin
Scenario: Verify login with empty pass
Given open login page
When login and password is empty
Then click button 'ENTER'
Then validate result "Неправильный логин или пароль"