# Building main.jac file

```jac
// import the graph and walker.
import {*} with "./graph.jac";
import {*} with "./walker.jac";

// this walker is reponsible for starting the program.
walker init {

    root {
        /// @notice creates the landing page
        spawn here ++> node::landing_page

        // creates an instant of the graph
        spawn here ++> graph::main_graph;

        // creates an instance of the walker, talker
        spawn  --> walker::talker;

        take-->[0];
    }
}
```
