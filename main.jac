// import the graph, kb file, and walkers.
import {*} with "./server/models/faq-state/faq_graph.jac";
import {*} with "./server/models/faq-state/ask.jac";
import {*} with "./server/models/faq-state/kb.jac";
import {*} with "./server/models/chat-state/chat_graph.jac";
import {*} with "./server/models/chat-state/talk.jac";
import {*} with "./server/models/ai_model.jac";
import {*} with "./server/models/bi_enc.jac";
import {*} with "./server/models/tfm_ner.jac";

/// @notice this walker is reponsible for starting the program.
walker init {
    std.actload_module("jac_nlp.use_qa");
    std.actload_module("jac_nlp.bi_enc");
    std.actload_module("jac_nlp.tfm_ner");
    root {
        server = spawn here ++> graph::faq_state;
        server = spawn here ++> graph::chat_state;
        spawn here walker::talk;
        spawn here walker::ingest_faq(kb_file="main_faq.json");
        while (true){
            spawn here walker::ask;
        }
    }
}
