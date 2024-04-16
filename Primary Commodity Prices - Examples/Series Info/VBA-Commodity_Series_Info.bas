Public Function CP_series_info(accessToken As String) As String

    Dim url As String
    Dim codes As String
    
    'This is the URL to the Primary Commodity Prices - Sandbox - Get Series Info operation:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/commodity_price/v1/sandbox/export/series"

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
            
    'Make a GET request to the Primary Commodity Prices - Sandbox - Get Series Info operation
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    CP_series_info = request.responseText
    
End Function