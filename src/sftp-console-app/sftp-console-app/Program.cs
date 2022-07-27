// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");

var client = new HttpClient();


// Call asynchronous network methods in a try/catch block to handle exceptions.
try
{
    HttpResponseMessage response = await client.GetAsync("http://www.contoso.com/");
    response.EnsureSuccessStatusCode();
    string responseBody = await response.Content.ReadAsStringAsync();
    // Above three lines can be replaced with new helper method below
    // string responseBody = await client.GetStringAsync(uri);

    Console.WriteLine(responseBody);
}
catch (HttpRequestException e)
{
    Console.WriteLine("\nException Caught!");
    Console.WriteLine("Message :{0} ", e.Message);
}

// create local user Azure API
// https://docs.microsoft.com/en-us/rest/api/storagerp/local-users/create-or-update?tabs=HTTP#createlocaluser

//var createLocalUser = new HttpRequestMessage(
//            HttpMethod.Put,
//            "https://management.azure.com/subscriptions/2b217d2b-cdc5-44ad-911f-0b89a2c2467c" +
//            "/resourceGroups/sftp-server/providers/Microsoft.Storage" +
//            "/storageAccounts/sftpstorageaccounteu/localUsers/testuser?api-version=2021-09-01")
//{
//    Headers =
//            {
//                { HeaderNames.Accept, "application/vnd.github.v3+json" },
//                { HeaderNames.UserAgent, "HttpRequestsSample" }
//            }
//};
