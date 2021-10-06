@Bukalapak
  Feature: Completing the register, login, search, and add to chart process
    @Register
    Scenario:
      Given I am access Bukalapak site
      When I go to register page
      Then Compare url

    @LoginSuccess
    Scenario:
      Given I am access Bukalapak site
      When  I go to login page
      Then  Input true password
      Then Compare after login

    @SearchSuccess
    Scenario:
      Given I am access Bukalapak site
      When I go to login page
      Then Input true password
      Then Go to search
      Then Compare after search

    @AddToCartSuccess
    Scenario:
      Given I am access Bukalapak site
      When I go to login page
      Then Input true password
      Then Go to search
      Then I add to cart
      Then Compare after cart