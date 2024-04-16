Public Function accessToken(Username As String, Password As String) As String

    Dim url As String
    Dim request As Object
    Dim jsonBody As String
    Dim response As String

    'This is the URL to the Intratec Access Token operation:
    url = "https://intratec.azure-api.net/access_token/v1"
    
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    'Build the JSON body containing the user information to generate the Token
    jsonBody = "{""username"": """ & Username & """, ""password"": """ & Password & """}"
 
    'Make a POST request to the Access Token operation
    request.Open "POST", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Content-Type", "application/json"
    request.send jsonBody
    
    accessToken = JsonConverter.ParseJson(request.responseText)("access_token")
    'Now you can use your Access Token in other Intratec operations

End Function