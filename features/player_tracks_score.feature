Feature: Player tracks their score automatically
  So that I can concentrate better on the game without distraction
  As a Player
  I want to be able to automatically track the current score of the game

  Rules:
    A turn or frame is 2 rolls of the ball
    A game is 10 frames
    Strike is when all pins are levelled in a single roll
    Spare is when all pins are knocked over in a single frame
    If the 10th frame is a strike I get an 11th frame
    If the 11th frame isa  strike I get a 12th frame

  Scenario: Gutter game ends in zero score
    Given I am the only player
    When I roll the ball 20 times missing all the pins
    Then my final score should be 0
    And I should be kicked from the bowling team

  Scenario: Without bonuses my score is the total of the pins knocked down
    Given I am the only player
    When I play 10 frames and hit 6 pins on each frame
    Then my final score should be 60
    And the junior team laugh at me

  Scenario: Perfect game scores 300
    Given I am the only player
    When I play 12 frames and hit all strikes
    Then my final score should be 300

  Scenario: Frame is marked as a spare when I hit 10 pins in 2 rolls
    Given I am the only player
    And this is the first frame
    When I hit 8 pins in the first roll
    And I hit 2 pins in the second roll
    Then my current score is 8
    And the second roll is marked as a spare

  Scenario: The score of a first roll after a spare is added to the score of the previous frame
    Given I have rolled a spare in the first frame
    And this is the second frame
    When I hit 3 pins in the next roll
    Then the score of the previous frame should be 13

  Scenario: The score of the entire frame after a strike is added to the score of the previous frame
    Given I have rolled a strike in the first frame
    And this is the second frame
    When I hit 1 pins in the first roll
    And I hit 2 pins in the second roll
    Then the score of the first frame is 13
    And the score of the second frame is 3
    And my current score is 1