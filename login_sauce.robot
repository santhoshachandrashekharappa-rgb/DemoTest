*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SAUCE_USERNAME}    %{SAUCE_USERNAME}
${SAUCE_ACCESS_KEY}    %{SAUCE_ACCESS_KEY}
${TUNNEL_NAME}    %{TUNNEL_NAME=Test_Automation}
${REMOTE_URL}    https://${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}@ondemand.saucelabs.com:443/wd/hub
${BROWSER}    chrome
${PLATFORM}    Windows 10
${RUN_ON_SAUCE}    %{RUN_ON_SAUCE=True}

*** Test Cases ***
Login to Sauce Labs with Tunnel
    [Documentation]    Sample test to run locally or on Sauce Labs using a tunnel
    IF    '${RUN_ON_SAUCE}' == 'True'
        ${capabilities}=    Create Dictionary
        ...    browserName=${BROWSER}
        ...    platform=${PLATFORM}
        ...    version=latest
        ...    username=${SAUCE_USERNAME}
        ...    accessKey=${SAUCE_ACCESS_KEY}
        ...    tunnelIdentifier=${TUNNEL_NAME}
        Open Browser    https://qa.westjet.com    remote_url=${REMOTE_URL}    desired_capabilities=${capabilities}
    ELSE
        Open Browser    https://qa.westjet.com    ${BROWSER}
    END
    Title Should Be    WestJet
    Close Browser