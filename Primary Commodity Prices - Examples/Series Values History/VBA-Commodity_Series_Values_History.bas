Public Function CP_series_values_hist(accessToken As String) As String

    Dim url As String
    Dim codes As String

    'Up to 40 codes can be requested at once by separating them with commas

    'Available codes are obtained via **Intratec Primary Commodity Prices - Series Info operation**.

    '>**E.g.:** 91201-1-5,69138-1-13

    'You can also add &c={Currency_ID} and/or &u={Unit_ID} after the code to select a different output currency and unit   

    '>**E.g.:** 91201-1-5&u=6 (Unit in Kilograms - kg) **||** 91201-1-5&c=9 (Currency in British Pounds - GBP)

    'You can specify both unit and currency for the same code, no matter the order of the parameters

    '>91201-1-5&u=6&c=9 **is equivalent to** 91201-1-5&c=9&u=6  


    '**{Currency_ID}** and **{Unit_ID}** can be found at Appendix of the PDF documentation

    'Find IDs for currency and unit of measurement in the API User Guide
    codes = "91201-1-5"
    
    'This is the URL to the Primary Commodity Prices - Sandbox - Series Values History operation:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/commodity_price/v1/sandbox/export/series_hist/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    'Make a GET request to the Primary Commodity Prices - Sandbox - Series Values History operation
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    CP_series_values_hist = request.responseText
    
End Function