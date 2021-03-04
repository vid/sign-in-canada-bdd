
@auth @CBS @logout @saml @sso

Feature: CATSLAB - SAML CSP-Initiated Logout using CBS
  
    Background:
        Given I open the Relying Party simulator page
        And I click on the button "English"

    Scenario: SAML CSP-Initiated Logout using CBS
        When I click on the checkbox "Level 2"
        And I click on the checkbox "Force Authn"
        And I click on the link "Login"
        Then I should be on the RP simulator English chooser page

        When I choose the SIC CSP
        And the element "Sign in with Sign-In Partner" is displayed
        And I click on the button "Sign in with Sign-In Partner"
        ## CBS Welcome Page
        And I should see "Select Sign-In Partner"
        And I click on the link "CBSTest1"
        Then the element "test-login" is displayed

        When I click on the link "test-login"
        And I should be on the RP simulator response page
        Then I should see "urn:oasis:names:tc:SAML:2.0:status:Success"

        # second RP
        When I open the Relying Party 2 simulator page
        And I click on the button "English"
        And I click on the checkbox "Level 2"
        And I click on the link "Login"
        And I should be on the RP simulator 2 English chooser page
        And I choose the CBS CSP
        And I should be on the RP simulator 2 response page
        Then I should see "urn:oasis:names:tc:SAML:2.0:status:Success"

        #Logout from second RP
        When I click on the button "Redirect Binding"
        Then I should see "Logout Response"
        And I should see "urn:oasis:names:tc:SAML:2.0:status:Success"