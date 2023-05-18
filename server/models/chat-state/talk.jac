walker talk {
    has prompts;
    can bi_enc.infer;
    root {
        prompts = std.input("User prompt > ");
        take --> node::server;
    }
    server {
        intent_labels = -[intent_transition]->.edge.intent;
        predicted_intent = bi_enc.infer(
            contexts = [prompts],
            candidates = intent_labels,
            context_type = "text",
            candidate_type = "text"
        )[0]["predicted"]["label"];
        take -[intent_transition(intent==predicted_intent)]-> node::chat_state;
    }
    chat_state {
        std.out(here.message);
    }
}
