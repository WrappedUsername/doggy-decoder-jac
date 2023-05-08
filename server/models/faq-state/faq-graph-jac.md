# Building the faq graph

```mermaid
graph TD;
    node_root-->node_server
    node_server-->node_models
    node_models-->node_faq_state
    node_faq_state-->node_faq_state_1
    node_faq_state-->node_faq_state_2
    node_faq_state-->node_faq_state_3
    node_faq_state-->node_faq_state_4
    node_faq_state-->node_faq_state_5
    node_faq_state-->node_faq_state_6
```

- Converting the pseudocode into Jac programming language:

## The faq_graph.jac file

```typescript
// Defining the nodes
node server;
node models;
node faq_state {
    has question;
    has answer;
}

// Static graph definition
graph faq {
    has anchor server;
    spawn {
        server = spawn node::server;
        models = spawn node::models;
        faq_state = spawn node::faq_state;
        faq_state_1 = spawn node::faq_state(
            question="What is Apexmite?",
            answer="TODO"
        );
        faq_state_2 = spawn node::faq_state(
            question="TODO",
            answer="TODO"
        );
        faq_state_3 = spawn node::faq_state(
            question="TODO",
            answer="TODO"
        );
        faq_state_4 = spawn node::faq_state(
            question="TODO",
            answer="TODO"
        );
        faq_state_5 = spawn node::faq_state(
            question="TODO",
            answer="TODO"
        );
        faq_state_6 = spawn node::faq_state(
            question="TODO",
            answer="TODO"
        );

        // Connecting the nodes together
        server ++> models;
        models ++> faq_state;
        faq_state ++> faq_state_1;
        faq_state ++> faq_state_2;
        faq_state ++> faq_state_3;
        faq_state ++> faq_state_4;
        faq_state ++> faq_state_5;
        faq_state ++> faq_state_6;
    }
}

walker init {
    root {
        spawn here ++> node::models;
    }
}
```

## The ask.jac file

```typescript
walker ask {
    can use.qa_classify;
    has question;
    root {
        question = std.input("User > ");
        take --> node::faq_state;
    }
    faq_state {
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
```

## The kb.jac file

```typescript
walker ingest_faq {
    has kb_file;
    root: take --> node::faq_state;
    faq_state {
        kb = file.load_json(kb_file);
        for faq in kb {
            spawn here ++> node::faq_state(answer=faq["answer"]);
        }
    }
}
```
