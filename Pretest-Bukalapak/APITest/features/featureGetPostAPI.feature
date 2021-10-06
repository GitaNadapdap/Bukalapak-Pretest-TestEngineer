@Api
Feature: Open Cypress API Site
  @GetApi
  Scenario:
    Given Access URI
    Then Compare

  @PostApi
  Scenario:
    Given Access post URI
    Then Compare result
