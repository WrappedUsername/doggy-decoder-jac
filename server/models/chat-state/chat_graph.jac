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
            message = "Welcome to Doggy Decoder! Are you ready to translate?",
            prompts = ["Yes","","","Quit"]
        );
        chat_state_2 = spawn node::chat_state(
            title = "Translate Page",
            message = "Great let's get started collecting training data for DIAT!",
            prompts = ["Yes","","","Quit"]
        );

        // Connecting the nodes together
        server ++> models;
        models ++> chat_state;
        chat_state ++> chat_state_1;
        chat_state ++> chat_state_2;

        /// @notice This is for new sign-ups to payment page.
        chat_state_1 +[intent_transition(intent="Yes")]+> node_success_page;
        /// @dev Please make this only accessable by auth-users from welcome page.
        // chat_state_1 +[intent_transition(intent="")]+> node_creator_dashboard;

        chat_state_2 +[intent_transition(intent="Welcome Page")]+> chat_state_1;
        // chat_state_2 +[intent_transition(intent="")]+> node_;
    }
}
