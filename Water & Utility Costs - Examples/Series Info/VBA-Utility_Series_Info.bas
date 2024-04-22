Public Function UC_series_info(accessToken As String) As String

    Dim url As String
    Dim codes As String
    
    'This is the URL to the Water & Utility Costs - Sandbox - Series Info operation:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/utility_cost/v1/sandbox/export/series"

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
            
    'Make a GET request to the Water & Utility Costs - Sandbox - Series Info operation
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    UC_series_info = request.responseText
    
End Function