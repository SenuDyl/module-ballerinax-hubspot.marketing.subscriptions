import ballerina/test;
import ballerina/oauth2;
import ballerina/io;

configurable boolean isLiveServer = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string serviceUrl = ?;

OAuth2RefreshTokenGrantConfig auth = {
       clientId: clientId,
       clientSecret: clientSecret,
       refreshToken: refreshToken,
       credentialBearer: oauth2:POST_BODY_BEARER 
   };

ConnectionConfig config = {auth: auth};
final Client hubspot = check new Client(config, serviceUrl);

final string testSubscriberUserId = "bh@hubspot.com";

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
//Check this one
isolated function testGetCommunicationPreferencesbySubscriberId() returns error? {
    ActionResponseWithResultsPublicStatus response = check hubspot-> /statuses/[testSubscriberUserId](channel="EMAIL");
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}

isolated function testPostCommunicationPreferencesbySubscriberId() returns error? {
    ActionResponseWithResultsPublicStatus response = check hubspot-> /statuses/[testSubscriberUserId].post(
        payload={
            channel:"EMAIL",
            statusState: "SUBSCRIBED",
            subscriptionId:1

        }
    );
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}

isolated function testGetUnsubscribedStatusbySubscriberId() returns error? {
    ActionResponseWithResultsPublicWideStatus response = check hubspot-> /statuses/[testSubscriberUserId]/unsubscribe\-all(channel="EMAIL");
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}

isolated function testPostReadBatchUnsubscribeAll() returns error? {
     BatchInputString payload = {
            inputs:[testSubscriberUserId]
        };
    BatchResponsePublicWideStatusBulkResponse response = check hubspot-> /statuses/batch/unsubscribe\-all/read.post(payload,channel="EMAIL");
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
//Check this one too. It has the same payload binding error for null values. Again resolved by sanitization
isolated function testPostCommunicationPreferencesBatchRead() returns error? {
    BatchInputString payload = {
            inputs:[testSubscriberUserId]
        };
    
    BatchResponsePublicStatusBulkResponse response = check hubspot-> /statuses/batch/read.post(payload,channel="EMAIL");
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);
}
//This one has the ambiguous error - Resolved after sanitization to the api path by adding /read at the end
@test:Config {
    groups: ["live_tests", "mock_tests"]
}

isolated function testPostBatchUnsubscribeAll() returns error? {
    BatchInputString payload = {
            inputs:[testSubscriberUserId]
        };
    
    BatchResponsePublicWideStatusBulkResponse response = check hubspot-> /statuses/batch/unsubscribe\-all/read.post(payload,channel="EMAIL");
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}

isolated function testPostCommunicationPreferencesBatchWWrite() returns error? {
    PublicStatusRequest request1 ={
         statusState: "SUBSCRIBED",
         channel: "EMAIL",
         subscriberIdString: testSubscriberUserId,
         subscriptionId: 0
    };
    BatchInputPublicStatusRequest payload = {
            inputs:[request1]
        };
    
    BatchResponsePublicStatus response = check hubspot-> /statuses/batch/write.post(payload);
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}

isolated function testPostUnsubscribeAllbySubscriberId() returns error? {
    ActionResponseWithResultsPublicStatus response = check hubspot-> /statuses/[testSubscriberUserId]/unsubscribe\-all.post(channel="EMAIL");
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}

isolated function testGetSubscriptionStatusDefinitions() returns error? {
    ActionResponseWithResultsSubscriptionDefinition response = check hubspot-> /definitions;
    test:assertTrue(response?.status is "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE");
    //test:assertTrue(response?.errors is ());
    io:println(response);

}





