@description('Specifies the location for resources.')
param location string = resourceGroup().location


var name = uniqueString(location)

var adminLogin  = uniqueString(resourceGroup().name)
var adminPassword = 'K.k@281107'

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: name
  location: location
 
   properties:{
     administratorLogin:adminLogin
     administratorLoginPassword:adminPassword
   }
}

output adminLog string = sqlServer.properties.administratorLogin
output state string = sqlServer.properties.state

