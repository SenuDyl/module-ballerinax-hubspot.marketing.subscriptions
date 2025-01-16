// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

public type ActionResponseWithResultsPublicWideStatus record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicWideStatus[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type BatchInputString record {
    string[] inputs;
};

public type StandardError record {
    record {} subCategory?;
    record {|string[]...;|} context;
    record {|string...;|} links?;
    string id?;
    string category;
    string message;
    ErrorDetail[] errors?;
    string status;
};

public type PublicStatus record {
    string subscriptionName?;
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    string subscriberIdString;
    "LEGITIMATE_INTEREST_PQL"|"LEGITIMATE_INTEREST_CLIENT"|"PERFORMANCE_OF_CONTRACT"|"CONSENT_WITH_NOTICE"|"NON_GDPR"|"PROCESS_AND_STORE"|"LEGITIMATE_INTEREST_OTHER"? legalBasis?;
    "RESUBSCRIBE_OCCURRED"|"NO_STATUS_CHANGE"|"UNSUBSCRIBE_FROM_ALL_OCCURRED"|"REQUESTED_CHANGE_OCCURRED"? setStatusSuccessReason?;
    string 'source;
    int:Signed32 subscriptionId;
    string? legalBasisExplanation?;
    int businessUnitId?;
    "SUBSCRIBED"|"UNSUBSCRIBED"|"NOT_SPECIFIED" status;
    string timestamp;
};

public type BatchResponsePublicStatusBulkResponseWithErrors record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicStatusBulkResponse[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type BatchResponsePublicStatusBulkResponse record {
    string completedAt;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicStatusBulkResponse[] results;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type ErrorDetail record {
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # The status code associated with the error detail
    string code?;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # Context about the error condition
    record {|string[]...;|} context?;
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
};

public type PublicWideStatus record {
    "PORTAL_WIDE"|"BUSINESS_UNIT_WIDE" wideStatusType;
    string subscriberIdString;
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    int businessUnitId?;
    "SUBSCRIBED"|"UNSUBSCRIBED"|"NOT_SPECIFIED" status;
    string timestamp;
};

public type ActionResponseWithResultsSubscriptionDefinition record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    SubscriptionDefinition[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

# Represents the Queries record for the operation: postCommunicationPreferencesV4StatusesBatchRead
public type PostCommunicationPreferencesV4StatusesBatchReadQueries record {
    # The channel type for the subscription type. Currently, the only supported channel type is `EMAIL`.
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    # If you have the [business unit add-on](https://developers.hubspot.com/beta-docs/guides/api/settings/business-units-api), include this parameter to filter results by business unit ID. The default Account business unit will always use `0`.
    int businessUnitId?;
};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.hubapi.com/oauth/v1/token";
|};

# Represents the Queries record for the operation: getCommunicationPreferencesV4StatusesSubscriberidstringUnsubscribeAll
public type GetCommunicationPreferencesV4StatusesSubscriberidstringUnsubscribeAllQueries record {
    # The channel type for the subscription type. Currently, the only supported channel type is `EMAIL`.
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    # If you have the [business unit add-on](https://developers.hubspot.com/beta-docs/guides/api/settings/business-units-api), include this parameter to filter results by business unit ID. The default Account business unit will always use `0`.
    int businessUnitId?;
    # Set to `true` to include the details of the updated subscription statuses in the response. Not including this parameter will result in an empty response.
    boolean verbose = false;
};

public type BatchResponsePublicBulkOptOutFromAllResponse record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicBulkOptOutFromAllResponse[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Provides Auth configurations needed when communicating with a remote HTTP endpoint.
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig|ApiKeysConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

public type PublicStatusBulkResponse record {
    string subscriberIdString;
    PublicStatus[] statuses;
};

public type PublicSubscriptionTranslation record {
    int:Signed32 createdAt;
    string name;
    string description;
    int:Signed32 subscriptionId;
    string languageCode;
    int:Signed32 updatedAt;
};

# Represents the Queries record for the operation: getCommunicationPreferencesV4StatusesSubscriberidstring
public type GetCommunicationPreferencesV4StatusesSubscriberidstringQueries record {
    # The channel type for the subscription type. Currently, the only supported channel type is `EMAIL`.
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    # If you have the [business unit add-on](https://developers.hubspot.com/beta-docs/guides/api/settings/business-units-api), include this parameter to filter results by business unit ID. The default Account business unit will always use `0`.
    int businessUnitId?;
};

# Represents the Queries record for the operation: getCommunicationPreferencesV4Definitions
public type GetCommunicationPreferencesV4DefinitionsQueries record {
    # Set to `true` to return subscription translations associated with each definition.
    boolean includeTranslations?;
    # If you have the [business unit add-on](https://developers.hubspot.com/beta-docs/guides/api/settings/business-units-api), include this parameter to filter results by business unit ID. The default Account business unit will always use `0`.
    int businessUnitId?;
};

public type PartialPublicStatusRequest record {
    "SUBSCRIBED"|"UNSUBSCRIBED"|"NOT_SPECIFIED" statusState;
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    "LEGITIMATE_INTEREST_PQL"|"LEGITIMATE_INTEREST_CLIENT"|"PERFORMANCE_OF_CONTRACT"|"CONSENT_WITH_NOTICE"|"NON_GDPR"|"PROCESS_AND_STORE"|"LEGITIMATE_INTEREST_OTHER" legalBasis?;
    int subscriptionId;
    string legalBasisExplanation?;
};

public type BatchResponsePublicStatus record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicStatus[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type PublicStatusRequest record {
    # The status of the contact's subscription.
    "SUBSCRIBED"|"UNSUBSCRIBED"|"NOT_SPECIFIED" statusState;
    # The type of communication channel. Currently, only `EMAIL` is supported.
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    # The contact's email address.
    string subscriberIdString;
    # The legal basis for communication.
    "LEGITIMATE_INTEREST_PQL"|"LEGITIMATE_INTEREST_CLIENT"|"PERFORMANCE_OF_CONTRACT"|"CONSENT_WITH_NOTICE"|"NON_GDPR"|"PROCESS_AND_STORE"|"LEGITIMATE_INTEREST_OTHER" legalBasis?;
    # The ID of the subscription to update.
    int:Signed32 subscriptionId;
    # The explanation for the legal basis.
    string legalBasisExplanation?;
};

public type PublicWideStatusBulkResponse record {
    PublicWideStatus[] wideStatuses;
    string subscriberIdString;
};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type ActionResponseWithResultsPublicStatus record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicStatus[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type BatchResponsePublicWideStatusBulkResponse record {
    string completedAt;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicWideStatusBulkResponse[] results;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

# Represents the Queries record for the operation: postCommunicationPreferencesV4StatusesBatchUnsubscribeAllRead
public type PostCommunicationPreferencesV4StatusesBatchUnsubscribeAllReadQueries record {
    # The channel type for the subscription type. Currently, the only supported channel type is `EMAIL`.
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    # If you have the [business unit add-on](https://developers.hubspot.com/beta-docs/guides/api/settings/business-units-api), include this parameter to filter results by business unit ID. The default Account business unit will always use `0`.
    int businessUnitId?;
};

public type BatchInputPublicStatusRequest record {
    PublicStatusRequest[] inputs;
};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

public type SubscriptionDefinition record {
    boolean isInternal;
    string createdAt;
    boolean isDefault;
    string communicationMethod?;
    string purpose?;
    string name;
    string description;
    string id;
    boolean isActive;
    int businessUnitId?;
    PublicSubscriptionTranslation[] subscriptionTranslations?;
    string updatedAt;
};

public type BatchResponsePublicWideStatusBulkResponseWithErrors record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicWideStatusBulkResponse[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

# Represents the Queries record for the operation: postCommunicationPreferencesV4StatusesSubscriberidstringUnsubscribeAll
public type PostCommunicationPreferencesV4StatusesSubscriberidstringUnsubscribeAllQueries record {
    # The channel type for the subscription type. Currently, the only supported channel type is `EMAIL`.
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    # If you have the [business unit add-on](https://developers.hubspot.com/beta-docs/guides/api/settings/business-units-api), include this parameter to filter results by business unit ID. The default Account business unit will always use `0`.
    int businessUnitId?;
    # Set to `true` to include the details of the updated subscription statuses in the response. Not including this parameter will result in an empty response.
    boolean verbose = false;
};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    string private\-app\-legacy;
    string private\-app;
|};

# Represents the Queries record for the operation: postCommunicationPreferencesV4StatusesBatchUnsubscribeAll
public type PostCommunicationPreferencesV4StatusesBatchUnsubscribeAllQueries record {
    # The channel type for the subscription type. Currently, the only supported channel type is `EMAIL`.
    "EMAIL"|"WHATSAPP"|"SMS" channel;
    # If you have the [business unit add-on](https://developers.hubspot.com/beta-docs/guides/api/settings/business-units-api), include this parameter to filter results by business unit ID. The default Account business unit will always use `0`.
    int businessUnitId?;
    # Set to `true` to include the details of the updated subscription statuses in the response. Not including this parameter will result in an empty response.
    boolean verbose = false;
};

public type PublicBulkOptOutFromAllResponse record {
    string subscriberIdString;
    PublicStatus[] statuses?;
};
