walker ingest_faq {
    has kb_file;
    root: take --> node::server;
    server {
        kb = file.load_json(kb_file);
        for faq_state in kb {
            spawn here ++> node::faq_state(answer=faq_state["answer"]);
        }
    }
}
