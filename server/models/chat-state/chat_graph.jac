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
            title = "Doggy Decoder Landing Page",
            message = "Welcome to Doggy Decoder! Are you ready to translate your dog's voice?",
            prompts = [
                "Yes",
                "Doggy Decoder Features and Benefits",
                "Doggy Decoder Webcam Translator",
                "Premium Beta Lifetime Membership Page",
                "Premium Beta Lifetime Membership Pricing Page",
                "Doggy Decoder Membership Page",
                "Doggy Decoder Membership Pricing Page"
                ]
        );
        chat_state_2 = spawn node::chat_state(
            title = "Doggy Decoder Features and Benefits",
            message = "",
            prompts = [
                "Yes",
                "Doggy Decoder Landing Page",
                "Doggy Decoder Webcam Translator",
                "Premium Beta Lifetime Membership Page",
                "Premium Beta Lifetime Membership Pricing Page",
                "Doggy Decoder Membership Page",
                "Doggy Decoder Membership Pricing Page"
                ]
        );
        chat_state_3 = spawn node::chat_state(
            title = "Doggy Decoder Webcam Translator",
            message = "",
            prompts = [
                "Yes",
                "Doggy Decoder Landing Page",
                "Doggy Decoder Features and Benefits",
                "Premium Beta Lifetime Membership Page",
                "Premium Beta Lifetime Membership Pricing Page",
                "Doggy Decoder Membership Page",
                "Doggy Decoder Membership Pricing Page"
                ]
        );
        chat_state_4 = spawn node::chat_state(
            title = "Premium Beta Lifetime Membership Page",
            message = "",
            prompts = [
                "Yes",
                "Doggy Decoder Landing Page",
                "Doggy Decoder Features and Benefits",
                "Doggy Decoder Webcam Translator",
                "Premium Beta Lifetime Membership Pricing Page",
                "Doggy Decoder Membership Page",
                "Doggy Decoder Membership Pricing Page"
                ]
        );
        chat_state_5 = spawn node::chat_state(
            title = "Premium Beta Lifetime Membership Pricing Page",
            message = "",
            prompts = [
                "Yes",
                "Doggy Decoder Landing Page",
                "Doggy Decoder Features and Benefits",
                "Doggy Decoder Webcam Translator",
                "Premium Beta Lifetime Membership Page",
                "Doggy Decoder Membership Page",
                "Doggy Decoder Membership Pricing Page"
                ]
        );
        chat_state_6 = spawn node::chat_state(
            title = "Doggy Decoder Membership Page",
            message = "",
            prompts = [
                "Yes",
                "Doggy Decoder Landing Page",
                "Doggy Decoder Features and Benefits",
                "Doggy Decoder Webcam Translator",
                "Premium Beta Lifetime Membership Page",
                "Premium Beta Lifetime Membership Pricing Page",
                "Doggy Decoder Membership Pricing Page"
                ]
        );
        chat_state_7 = spawn node::chat_state(
            title = "Doggy Decoder Membership Pricing Page",
            message = "",
            prompts = [
                "Yes",
                "Doggy Decoder Landing Page",
                "Doggy Decoder Features and Benefits",
                "Doggy Decoder Webcam Translator",
                "Premium Beta Lifetime Membership Page",
                "Premium Beta Lifetime Membership Pricing Page",
                "Doggy Decoder Membership Page",
                ]
        );

        // Connecting the nodes together
        server ++> models;
        models ++> chat_state;
        chat_state ++> chat_state_1;
        chat_state ++> chat_state_2;
        chat_state ++> chat_state_3;
        chat_state ++> chat_state_4;
        chat_state ++> chat_state_5;
        chat_state ++> chat_state_6;
        chat_state ++> chat_state_7;

        /// @notice This is for new sign-ups to payment page.
        chat_state_1 +[intent_transition(intent="Yes")]+> node_landing_page;
        chat_state_1 +[intent_transition(intent="Doggy Decoder Features and Benefits")]+> chat_state_2;
        chat_state_1 +[intent_transition(intent="Doggy Decoder Webcam Translator")]+> chat_state_3;
        chat_state_1 +[intent_transition(intent="Premium Beta Lifetime Membership Page")]+> chat_state_4;
        chat_state_1 +[intent_transition(intent="Premium Beta Lifetime Membership Pricing Page")]+> chat_state_5;
        chat_state_1 +[intent_transition(intent="Doggy Decoder Membership Page")]+> chat_state_6;
        chat_state_1 +[intent_transition(intent="Doggy Decoder Membership Pricing Page")]+> chat_state_7;

        chat_state_2 +[intent_transition(intent="Yes")]+> node_features_benefits_page;
        chat_state_2 +[intent_transition(intent="Doggy Decoder Landing Page")]+> chat_state_1;
        chat_state_2 +[intent_transition(intent="Doggy Decoder Webcam Translator")]+> chat_state_3;
        chat_state_2 +[intent_transition(intent="Premium Beta Lifetime Membership Page")]+> chat_state_4;
        chat_state_2 +[intent_transition(intent="Premium Beta Lifetime Membership Pricing Page")]+> chat_state_5;
        chat_state_2 +[intent_transition(intent="Doggy Decoder Membership Page")]+> chat_state_6;
        chat_state_2 +[intent_transition(intent="Doggy Decoder Membership Pricing Page")]+> chat_state_7;

        chat_state_3 +[intent_transition(intent="Yes")]+> node_webcam_translator_page;
        chat_state_3 +[intent_transition(intent="Doggy Decoder Landing Page")]+> chat_state_1;
        chat_state_3 +[intent_transition(intent="Doggy Decoder Features and Benefits")]+> chat_state_2;
        chat_state_3 +[intent_transition(intent="Premium Beta Lifetime Membership Page")]+> chat_state_4;
        chat_state_3 +[intent_transition(intent="Premium Beta Lifetime Membership Pricing Page")]+> chat_state_5;
        chat_state_3 +[intent_transition(intent="Doggy Decoder Membership Page")]+> chat_state_6;
        chat_state_3 +[intent_transition(intent="Doggy Decoder Membership Pricing Page")]+> chat_state_7;

        chat_state_4 +[intent_transition(intent="Yes")]+> node_lifetime_membership_page;
        chat_state_4 +[intent_transition(intent="Doggy Decoder Landing Page")]+> chat_state_1;
        chat_state_4 +[intent_transition(intent="Doggy Decoder Features and Benefits")]+> chat_state_2;
        chat_state_4 +[intent_transition(intent="Doggy Decoder Webcam Translator")]+> chat_state_3;
        chat_state_4 +[intent_transition(intent="Premium Beta Lifetime Membership Pricing Page")]+> chat_state_5;
        chat_state_4 +[intent_transition(intent="Doggy Decoder Membership Page")]+> chat_state_6;
        chat_state_4 +[intent_transition(intent="Doggy Decoder Membership Pricing Page")]+> chat_state_7;

        chat_state_5 +[intent_transition(intent="Yes")]+> node_lifetime_membership_pricing_page;
        chat_state_5 +[intent_transition(intent="Doggy Decoder Landing Page")]+> chat_state_1;
        chat_state_5 +[intent_transition(intent="Doggy Decoder Features and Benefits")]+> chat_state_2;
        chat_state_5 +[intent_transition(intent="Doggy Decoder Webcam Translator")]+> chat_state_3;
        chat_state_5 +[intent_transition(intent="Premium Beta Lifetime Membership Page")]+> chat_state_4;
        chat_state_5 +[intent_transition(intent="Doggy Decoder Membership Page")]+> chat_state_6;
        chat_state_5 +[intent_transition(intent="Doggy Decoder Membership Pricing Page")]+> chat_state_7;

        chat_state_6 +[intent_transition(intent="Yes")]+> node_normal_membership_page;
        chat_state_6 +[intent_transition(intent="Doggy Decoder Landing Page")]+> chat_state_1;
        chat_state_6 +[intent_transition(intent="Doggy Decoder Features and Benefits")]+> chat_state_2;
        chat_state_6 +[intent_transition(intent="Doggy Decoder Webcam Translator")]+> chat_state_3;
        chat_state_6 +[intent_transition(intent="Premium Beta Lifetime Membership Page")]+> chat_state_4;
        chat_state_6 +[intent_transition(intent="Premium Beta Lifetime Membership Pricing Page")]+> chat_state_5;
        chat_state_6 +[intent_transition(intent="Doggy Decoder Membership Pricing Page")]+> chat_state_7;

        chat_state_7 +[intent_transition(intent="Yes")]+> node_normal_membership_pricing_page;
        chat_state_7 +[intent_transition(intent="Doggy Decoder Landing Page")]+> chat_state_1;
        chat_state_7 +[intent_transition(intent="Doggy Decoder Features and Benefits")]+> chat_state_2;
        chat_state_7 +[intent_transition(intent="Doggy Decoder Webcam Translator")]+> chat_state_3;
        chat_state_7 +[intent_transition(intent="Premium Beta Lifetime Membership Page")]+> chat_state_4;
        chat_state_7 +[intent_transition(intent="Premium Beta Lifetime Membership Pricing Page")]+> chat_state_5;
        chat_state_7 +[intent_transition(intent="Doggy Decoder Membership Page")]+> chat_state_6;
    }
}
