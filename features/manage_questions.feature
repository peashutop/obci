Feature: Manage questions
  In order to manage the questions presented to the veteran 
  Administrator
  wants to add,delete,create,reorder questions
  
	Scenario: Questions List
		Given I have questions short_named Question1, Question2, Question3
		When I go to the list of questions
		Then I should see "Question1"
		And I should see "Question2"
		And I should see "Question3"
	
  Scenario: Register new question
    Given I am on the new question page
    When I fill in "Name short" with "name_short 1"
    And I fill in "Content" with "content 1"
    And I press "Create"
    Then I should see "name_short 1"
    And I should see "content 1"

  Scenario: Delete question
    Given the following questions:
      | name_short   | content   |
      | name_short 1 | content 1 |
      | name_short 2 | content 2 |
      | name_short 3 | content 3 |
      | name_short 4 | content 4 |
    When I delete the 3rd question
    Then I should see the following questions:
      | Name short   | Content   |
      | name_short 1 | content 1 |
      | name_short 2 | content 2 |
      | name_short 4 | content 4 |
