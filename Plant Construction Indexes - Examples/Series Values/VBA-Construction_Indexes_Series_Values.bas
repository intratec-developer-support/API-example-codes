Public Function CI_series_values(accessToken As String) As String

    Dim url As String
    Dim codes As String

    'Up to 40 codes can be requested at once by separating them with commas

    'Available codes are obtained via **Intratec Plant Construction Indexes - Series Info operation**.

    '>**E.g.:** 8318-5-2,912-5-2

    codes = "8318-5-2"
    
    'This is the URL to the Plant Construction Indexes - Sandbox - Series Values operation:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/cost_indexs/v1/sandbox/export/series/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    'Make a GET request to the Plant Construction Indexes - Sandbox - Series Values operation
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    CI_series_values = request.responseText
    
End Function