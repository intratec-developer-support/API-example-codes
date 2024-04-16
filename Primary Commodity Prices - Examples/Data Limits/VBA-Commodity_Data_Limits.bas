Public Function CP_data_limits(accessToken As String) As String

    Dim url As String
    Dim codes As String
    
    'This is the URL to the Data Limits - Primary Commodity Prices API:
    'If you want to check the limits for the Get Series Values History operation, replace "data_limits" with "data_limits-hist"
    url = "https://intratec.azure-api.net/commodity_price/v1/data_limits"

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")

    'Make a GET request to the Primary Commodity Prices - Data Limits API
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    CP_data_limits = request.responseText
    
End Function