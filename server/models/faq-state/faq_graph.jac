// Defining the nodes
node server;
node models;
node faq_state {
    has question;
    has answer;
}

// Static faq state graph
graph faq_state {
    has anchor server;
    spawn {
        server = spawn node::server;
        models = spawn node::models;
        faq_state = spawn node::faq_state;
        faq_state_1 = spawn node::faq_state(
            question="What is Doggy Decoder?",
            answer="Doggy Decoder Landing Page"
        );
        faq_state_2 = spawn node::faq_state(
            question="What are the benefits of using Doggy Decoder?",
            answer="Doggy Decoder Features and Benefits"
        );
        faq_state_3 = spawn node::faq_state(
            question="How do I use Doggy Decoder?",
            answer="Doggy Decoder Webcam Translator"
        );
        faq_state_4 = spawn node::faq_state(
            question="What is the Premium Beta Lifetime Membership?",
            answer="Premium Beta Lifetime Membership Page"
        );
        faq_state_5 = spawn node::faq_state(
            question="How much does the Premium Beta Lifetime Membership cost?",
            answer="Premium Beta Lifetime Membership Pricing Page"
        );
        faq_state_6 = spawn node::faq_state(
            question="What is the Doggy Decoder Membership?",
            answer="Doggy Decoder Membership Page"
        );
        faq_state_7 = spawn node::faq_state(
            question="How much does the Doggy Decoder Membership cost?",
            answer="Doggy Decoder Membership Pricing Page"
        );
        // ready to expand faq...
        // faq_state_8 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );
        // faq_state_9 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );
        // faq_state_10 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );
        // faq_state_11 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );
        // faq_state_12 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );
        // faq_state_13 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );
        // faq_state_14 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );
        // faq_state_15 = spawn node::faq_state(
        //     question="?",
        //     answer=""
        // );

        // Connecting the nodes together.
        server ++> models;
        models ++> faq_state;
        faq_state ++> faq_state_1;
        faq_state ++> faq_state_2;
        faq_state ++> faq_state_3;
        faq_state ++> faq_state_4;
        faq_state ++> faq_state_5;
        faq_state ++> faq_state_6;
        faq_state ++> faq_state_7;
        // ready to expand faq...
        // faq_state ++> faq_state_8;
        // faq_state ++> faq_state_9;
        // faq_state ++> faq_state_10;
        // Some people might have a lot of questions...
        // faq_state ++> faq_state_11;
        // faq_state ++> faq_state_12;
        // faq_state ++> faq_state_13;
        // faq_state ++> faq_state_14;
        // faq_state ++> faq_state_15;
    }
}

walker init {
    root {
        spawn here ++> node::models;
    }
}
