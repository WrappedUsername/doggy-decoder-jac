# Building graph.jac file

```mermaid
graph TD;
    node_root-->node_biencoder_model
    node_root-->node_entity_extraction
    node_root-->node_embedding_cache
    node_root-->node_conv_root_state
    node_conv_root_state-->node_VA_state_3
    node_VA_state_3-->node_VA_state_1
    node_VA_state_3-->node_VA_state_2
    node_VA_state_1-->node_VA_state_2
    node_conv_root_state-->node_VA_state_1
    node_conv_root_state-->node_VA_state_2
    node_conv_root_state-->node_faq_state
    node_faq_state-->node_faq_answer_1
    node_faq_state-->node_faq_answer_2
    node_faq_state-->node_faq_answer_3
```

- Converting the pseudocode into Jac programming language:

```JavaScript
/** 
 * Conversation root state is the name of this node,
 * the majority of the logic is contain in the node abilities,
 * of the conversation root state node. Conversation root sate node abilities,
 * are triggered by talker walker entry and exit.
*/ 
node state {
    has title;
    has message;
    has prompts;
}

edge transition {
    has intent;
}

graph main_graph {
    has anchor main_root;
}
```
