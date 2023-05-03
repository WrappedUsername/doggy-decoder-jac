walker ingest_faq {
    has kb_file;
    root: take --> node::faq_state;
    faq_state {
        kb = file.load_json(kb_file);
        for faq_state in kb {
            spawn here ++> node::faq_state(answer=faq_state["answer"]);
        }
    }
}
