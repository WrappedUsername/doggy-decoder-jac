# Building the landing_page.jac node

The structure of the app will be in the form of a graph.

- Creating markdown mermaid diagrams as pseudocode:

```mermaid
graph TD;
    node_root-->node_landing_page
    node_landing_page-->node_success_page
    node_success_page-->node_conversion_page
    node_conversion_page-->node_webcam_ai_chat
    node_user_profile_dashboard<-->node_webcam_ai_chat
    node_webcam_ai_chat-->node_training_data_collector
    node_root-->node_auth_user_dir
    node_auth_user_dir-->node_user_data_1
    node_auth_user_dir-->node_user_data_2
    node_auth_user_dir-->node_user_data_3
    node_user_profile_dashboard<-->node_auth_user_dir
```

```jac
node root;
node landing_page {
    has title;
    has message;
    has prompts;
    has hero_section;
    has call_to_action;

    /// @notice declaring that something
    // can do_something;

    /// @notice The nodes abililty to do something (a function)
    // can do_something {}
}

/**
 * This is a transition edge, and it has the intent to traverse to the next,
 * node.
*/
edge transition {
    has intent;
}

graph landing_page_graph {
    has anchor root;

    spawn {
        root = spawn node::landing_page(
        title = "Welcome",
        message = "Welcome to Doggy Decoder! How can I help, today?",
        hero_section = "TODO", // @dev Maybe import this, from it's own file, if it's large.
        call_to_action = "TODO",
        prompts = ["TODO_1","TODO_2","prices","quit"]
    );

    prices = spawn root +[transition(intent="prices")] +> node::landing_page(
        title = "prices",
        message = "Prices...TODO message",
        prompts = ["TODO_3", "TODO_4" ,"TODO_5", "quit"]
    );

    TODO_3 = spawn TODO +[transition(intent="TODO_3")] +> node::landing_page(
        title = "TODO_3",
        message = "TODO_3",
        prompts = ["TODO_6", "quit"]
    );
        
        TODO_3 +[transition(intent="TODO_6")] +> TODO;

    TODO_4 = spawn TODO +[transition(intent="TODO_4")] +> node::landing_page(
        title = "TODO_4",
        message = "TODO_4",
        prompts = ["TODO_6", "quit"]
    );

        TODO_4 +[transition(intent="TODO_6")] +> TODO;

    TODO_5 = spawn TODO +[transition(intent="TODO_5")] +> node::landing_page(
        title = "TODO",
        message = "TODO",
        prompts = ["TODO_6","quit"]
    );

        TODO_5 +[transition(intent="TODO_6")] +> TODO;

    TODO_1 = spawn root +[transition(intent="TODO_1")]+> node::landing_page(
        title = "TODO_1",
        message = "TODO_1",
        prompts = ["TODO_2","TODO_7","prices","quit"]
    );

    TODO_2 = spawn TODO_1 +[transition(intent="TODO_2")]+> node::landing_page(
        title = "TODO_2",
        message = "TODO_1",
        prompts = ["TODO_8","TODO_7","quit"]
    );

        root +[transition(intent="TODO_2")] +> TODO_2;

    TODO_8 = spawn TODO_2 +[transition(intent="TODO_8")]+> node::landing_page(
        title = "TODO_2",
        message ="TODO_1",
        prompts = ['TODO_7',"quit"]
    );

    TODO_7 = spawn TODO_2 +[transition(intent="TODO_7")]+> node::landing_page(
        title = "TODO_7",
        message ="TODO_1",
        prompts = ['TODO_2',"quit"]
    );

        TODO_8 + [transition(intent="TODO_7")] +> TODO_7 ;
        TODO_7 + [transition(intent="TODO_2")] +> TODO_2 ;

    }
}
```
