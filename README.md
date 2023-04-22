# Doggy Decoder, Digital Intelligence Animal Translator (DIAT) - Powered by [Jaseci](https://github.com/Jaseci-Labs/jaseci) and Jac - 🚧 Work In Progress 🏗

<p align="left">
<img src="https://komarev.com/ghpvc/?username=doggy-decoder-jac&label=Profile%20views&color=f79952&style=flat" alt="doggy-decoder-jac" />
<img alt="Stars" src="https://img.shields.io/github/stars/WrappedUsername/doggy-decoder-jac?style=flat-square&labelColor=343b41"/>
</p>

The structure of the app will be in the form of a graph.

## Possible activation functions for the DNN  

- The rectified linear unit (ReLU) activation function can be used for faster model training. However, a linear activation function has two major problems :

It’s not possible to use backpropagation as the derivative of the function is a constant and has no relation to the input x.
All layers of the neural network will collapse into one if a linear activation function is used. No matter the number of layers in the neural network, the last layer will still be a linear function of the first layer. So, essentially, a linear activation function turns the neural network into just one layer.

- The DNN will be using a Tanh activation function for sentiment analysis.
- The DNN will also use Sigmoid activation function for probability distributions.

- Creating markdown mermaid diagrams as pseudocode:

```mermaid
graph TD;
    root-->node_landing_page
    node_landing_page-->node_success_page
    node_success_page-->node_conversion_page
    node_conversion_page-->node_webcam_ai_chat
```

```mermaid

---
title: Sign-up example
---
erDiagram
    ANON-GUEST-ACCESS ||--o{ SIGN-UP : clicks-cta-button
    BETA-ACCESS-SIGN-UP ||--|{ BETA-ACCESS-LIFETIME-MEMBERSHIP : contains
    AUTHORIZED-USERS }|..|{ AI-PROFILE-AVATAR-GENERATOR-DASHBOARD : uses
    BETA-ACCESS-LIFEETIME-MEMBERSHIP }|..|{ AI-ANIMAL-TRANSLATOR : enjoys
```

## Building main.jac file

- Converting the pseudocode into Jac programming language:

```jac
# import the graph and walker.
import {*} with "./graph.jac";
import {*} with "./walker.jac";

# this walker is reponsible for starting the program.
walker init {

    root {
        /// @notice creates the landing page
        spawn here ++> node::landing_page

        #creates an instant of the graph
        spawn here ++> graph::main_graph;

        #creates an instance of the walker, talker
        spawn  --> walker::talker;
    }
}
```

## Continued in moreREADME folder
