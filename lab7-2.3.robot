*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FORM_URL}    http://localhost:7272/Form.html
${CHROME_BROWSER_PATH}     C:/Users/franc/Downloads/ChromeForTesting/chrome-win64/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}      C:/Users/franc/Downloads/ChromeForTesting/chromedriver-win64/chromedriver-win64/chromedriver.exe

*** Test Cases ***
UAT-Lab7-002.3: Fill, Submit Form, and Capture Screenshots
    # สร้าง ChromeOptions object
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}

    # สร้าง ChromeDriver Service
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r"""${CHROME_DRIVER_PATH}""")    sys

    # เปิดเว็บไซต์ Form.html
    Open Browser    ${FORM_URL}    Chrome
    Maximize Browser Window

    # ใช้ Run Keyword And Ignore Error เพื่อจับข้อผิดพลาด
    ${result}=    Run Keyword And Ignore Error    Fill Form And Submit

    # ปิดเบราว์เซอร์
    Close Browser

*** Keywords ***
Fill Form And Submit
    # กรอกข้อมูลในฟอร์ม
    Input Text    id=firstname       Somsong
    Input Text    id=lastname        Sandee
    Input Text    id=destination     Europe
    Input Text    id=contactperson   Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email           somsong@
    Input Text    id=phone           081-111-1234
    
    # กดปุ่ม Submit
    Click Button    id=submitButton

    # ตรวจสอบว่าหน้า Complete.html แสดง Title ถูกต้อง
    Wait Until Page Contains    Completed
    Page Should Contain         Our agent will contact you shortly.
    Page Should Contain         Thank you for your patient.