walker ask {
    can use.qa_classify;
    has question;
    root {
        question = std.input("User question > ");
        take --> node::server;
    }
    server {
        answers = -->.answer;
        best_answer = use.qa_classify(
            text = question,
            classes = answers
        );
        take --> node::faq_state(answer==best_answer["match"]);
    }
    faq_state {
        std.out(here.answer);
    }
}
