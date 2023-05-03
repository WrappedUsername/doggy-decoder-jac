// Defining the nodes
node server;
node models;
node chat_state {
    has title;
    has message;
    has prompts;
}

edge intent_transition {
    has intent;
}

// Static chat state graph

graph chat_state {
    has anchor server;
    spawn {
        server = spawn node::server;
        models = spawn node::models;
        chat_state = spawn node::chat_state;
        /// @notice This is the chat state used for the landing page, or returning auth-users.
        chat_state_1 = spawn node::chat_state(
            title = "Welcome Page",
            message = "Welcome to Apexmite! Are you ready to report a sighting?",
            prompts = ["Yes","Creator Dashboard","","Quit"]
        );
        chat_state_2 = spawn node::chat_state(
            title = "Creator Dashboard",
            message = "Welcome your Apexmite Content Federation, Creator Dashboard! Are you ready to ?",
            prompts = ["Yes","Welcome Page","","Quit"]
        );

        // Connecting the nodes together
        server ++> models;
        models ++> chat_state;
        chat_state ++> chat_state_1;
        chat_state ++> chat_state_2;

        /// @notice This is for new sign-ups to payment page.
        chat_state_1 +[intent_transition(intent="Yes")]+> node_success_page;
        /// @dev Please make this only accessable by auth-users from welcome page.
        chat_state_1 +[intent_transition(intent="Creator Dashboard")]+> node_creator_dashboard;

        chat_state_2 +[intent_transition(intent="Welcome Page")]+> chat_state_1;
        chat_state_2 +[intent_transition(intent="Creator Dashboard")]+> node_creator_dashboard;
    }
}
