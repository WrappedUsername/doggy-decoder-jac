# Building main.jac file

```typescript
// import the graph and walker.
import {*} with "./chat_graph.jac";
import {*} with "./faq_graph.jac";
import {*} with "./walker.jac";

/// @notice this walker is reponsible for starting the program.
walker init {

    root {
        // creates an instant of the chat_graph
        spawn here ++> graph::chat_graph;
        
        // creates an instant of the faq_graph
        spawn here ++> graph::chat_graph;

        // creates an instance of the walker, talker
        spawn --> walker::talker;
    }
}
```
