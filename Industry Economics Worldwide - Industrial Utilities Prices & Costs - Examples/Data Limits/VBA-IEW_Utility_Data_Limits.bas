Public Function IE_data_limits(accessToken As String) As String

    Dim url As String
    Dim codes As String
    
    'This is the URL to the Industry Economics -  Utility Costs - Data Limits operation:
    url = "https://intratec.azure-api.net/utility_cost/v1/data_limits"

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")

    'Make a GET request to the Industry Economics -  Utility Costs - Data Limits operation
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    IE_data_limits = request.responseText
    
End Function