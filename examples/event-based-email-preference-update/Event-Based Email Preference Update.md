# Event-Based Email Preference Update

This use case demonstrates how email preferences for event attendees can be managed to ensure they receive relevant updates. Attendees are checked for subscription status before the event, and those who unsubscribed are resubscribed in bulk afterward, improving engagement and streamlining future communication.

# Prerequisites

## Configuration

Create a Config.toml file in the example's root directory and, provide your HubSpot account related configurations as follows:

    ```toml
    clientId= "<clientId>"
    clientSecret= "<clientSecret>"
    refreshToken= "<refreshToken>"
    ```

# Run the example

Execute the following command to run the example:

    ```bash
    bal run
    ```
