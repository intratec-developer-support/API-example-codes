Public Function UC_series_values_hist(accessToken As String) As String

    Dim url As String
    Dim codes As String

    'Up to 40 codes can be requested at once by separating them with commas

    'Available codes are obtained via **Intratec Water & Utility Costs - Series Info operation**.

    '>**E.g.:** 73470-7-1,39141-7-2

    'You can also add &c={Currency_ID} and/or &u={Unit_ID} after the code to select a different output currency and unit   

    '>**E.g.:** 73470-7-1&u=5 (Unit in Normal Cubic Meter - Nm3) **||** 73470-7-1&c=9 (Currency in British Pounds - GBP)

    'You can specify both unit and currency for the same code, no matter the order of the parameters

    '>73470-7-1&u=5&c=9 **is equivalent to** 73470-7-1&c=9&u=5  


    '**{Currency_ID}** and **{Unit_ID}** can be found at Appendix of the PDF documentation

    'Find IDs for currency and unit of measurement in the API User Guide
    codes = "73470-7-1"
    
    'This is the URL to the Water & Utility Costs - Sandbox - Series Values History operation:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/utility_cost/v1/sandbox/export/series_hist/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    'Make a GET request to the Water & Utility Costs - Sandbox - Series Values History operation
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    UC_series_values_hist = request.responseText
    
End Function