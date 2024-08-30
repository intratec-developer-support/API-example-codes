Public Function IE_LF_series_values_hist(accessToken As String) As String

    Dim url As String
    Dim codes As String

    'Up to 40 codes can be requested at once by separating them with commas

    'Available codes are obtained via **Intratec Industry Economics Worldwide - Plant Location Factors - Series Info operation**.

    '**E.g.:** 2259-6-2,3943-6-2

    codes = "2259-6-2"
    
    'This is the URL to the Industry Economics Worldwide - Plant Location Factors - Sandbox - Series Values History operation:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/location_factor/v1/sandbox/export/series_hist/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    'Make a GET request to the Industry Economics Worldwide - Plant Location Factors - Sandbox - Series Values History operation
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    IE_LF_series_values_hist = request.responseText
    
End Function