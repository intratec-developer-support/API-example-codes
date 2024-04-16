Public Function CP_series_values(accessToken As String) As String

    Dim url As String
    Dim codes As String

    'Up to 40 codes can be requested at once by dividing the codes with commas
    '**Example:** '91201-1-5', '91201-1-5'

    'You can also add &c={Currency_ID} and/or &u={Unit_ID} after the code to specify the currency and unit to display the values in
    '**Example:** '91201-1-5&u=6' (Unit in Kilograms - kg),'91201-1-5&c=9' (Currency in British Pounds - GBP)

    'You can specify both unit and currency for the same code, no matter the order of the parameters

    '91201-1-5&u=6&c=9' **is equivalent to** '91201-1-5&c=9&u=6'

    '**{Currency_ID}** and **{Unit_ID}** can be found at Appendix of the PDF documentation

    'Available units and currencies are found in the response of **Intratec Primary Commodity Prices - Series Info API**
    codes = "91201-1-5"
    
    'This is the URL to the Sandbox - Series Values - Primary Commodity Prices API:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/commodity_price/v1/sandbox/export/series/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    'Make a GET request to the Primary Commodity Prices - Series Values API
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    CP_series_values = request.responseText
    
End Function