*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FORM_URL}                http://localhost:7272/Form.html
${CHROME_BROWSER_PATH}     C:/Users/franc/Downloads/ChromeForTesting/chrome-win64/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}      C:/Users/franc/Downloads/ChromeForTesting/chromedriver-win64/chromedriver-win64/chromedriver.exe
${COMPLETE_TITLE}          Completed
${COMPLETE_TEXT_1}         Our agent will contact you shortly.
${COMPLETE_TEXT_2}         Thank you for your patient.
${FORM_SCREENSHOT_PATH}    Form_Page_Screenshot.png
${COMPLETE_SCREENSHOT_PATH}  Complete_Page_Screenshot.png

*** Test Cases ***
UAT-Lab7-001: Fill, Submit Form, and Capture Screenshots
    # เปิดเว็บไซต์ Form.html
    Open Browser    ${FORM_URL}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    css:form

    # กรอกข้อมูลในฟอร์ม
    Input Text    id=firstname       Somsong
    Input Text    id=lastname        Sandee
    Input Text    id=destination     Europe
    Input Text    id=contactperson   Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email           somsong@kkumail.com
    Input Text    id=phone           081-111-1234

    # บันทึกหน้าจอของหน้า Form.html
    Capture Page Screenshot    ${FORM_SCREENSHOT_PATH}
    
    # กดปุ่ม Submit
    Click Button    id=submitButton

    # ตรวจสอบว่าหน้า Complete.html แสดง Title ถูกต้อง
    Wait Until Page Contains    ${COMPLETE_TITLE}
    Page Should Contain         ${COMPLETE_TEXT_1}
    Page Should Contain         ${COMPLETE_TEXT_2}

    # บันทึกหน้าจอของหน้า Complete.html
    Capture Page Screenshot    ${COMPLETE_SCREENSHOT_PATH}

    # หน่วงเวลาเพื่อให้เห็นหน้า
    Sleep    10s

    # ปิดเบราว์เซอร์
    Close Browser