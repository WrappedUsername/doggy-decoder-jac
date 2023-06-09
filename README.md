# 🐶 Doggy Decoder, Digital Intelligence Animal Translator (DIAT) - Powered by [Jaseci](https://github.com/Jaseci-Labs/jaseci) and Jac - 🚧 Work In Progress 🏗

<p align="left">
<img src="https://komarev.com/ghpvc/?username=doggy-decoder-jac&label=Profile%20views&color=f79952&style=flat" alt="doggy-decoder-jac" />
<img alt="Stars" src="https://img.shields.io/github/stars/WrappedUsername/doggy-decoder-jac?style=flat-square&labelColor=343b41"/>
</p>

![doggy-decoder-logo](https://user-images.githubusercontent.com/104662990/234423715-bb940989-cf4c-4cb3-a2a5-feaab8d592a0.jpeg)

### I have no idea if this is even possible, but I think this will be a really fun project, and worth the effort to try to be the first to build an AI animal translator. I am not the only one with a project like this, so I might as well try to be the first AI animal translator

- DIAT, a voice-to-text, text-to-voice enabled, machine vision, image classifaction capable, customizable avatar AI, using a webcam module interface to interact with authorized users, and anon guests at sign up.
- The conversational AI Agent, will be used to interact with the human user, and provide value and helpful assistance throughout the user experience, beyond just providing animal translations.
- The machine vision and audio capable AI Agent will collect animal sounds and visual behaviour for mapping the relational training data.
- DIAT will be able to collect and train itself to translate any animal sounds (cats, dolphins, etc.) creating new training data, in order to translate all animal sounds (I just thought Doggy Decoder sounds cool, I also considered Parrot Pal).

```yml
Saving state with a maintainer walker:
```

```jac
can cleanup with talker entry{
    if (!vistor:hoping) {
       spawn *(global.node_conv_root_state) walker::maintainer(
            user_id = visitor.user_id,
            user_context = vistor.user_context,
            dialogue_context = vistor.dialogue_context,
            last_conv_state = vistor.state_for_continuing
            // Add ERC-4337 account abstractions or any other saved states, etc here.
       );
    }
}
```

- Nodes, edges, and walkers can all have abilities.
  - Abilities cannot interact outside of the context and local variables of the attached node, edge, or walker, and does not have a return meaning.

The structure of the app will be in the form of a graph.

[reference: Jaseci Bible](https://github.com/Jaseci-Labs/jaseci/raw/main/support/bible/pdf/jaseci_bible.pdf)

```yml
Jaseci Graph described as a 7-tuple (N, E, C, s, t, cN , cE ), where:
```

```mermaid
---
title: 7-tuple (N, E, C, s, t, cN , cE) Jaseci Graph
---
classDiagram
  N --> E : s = maps the source node to an edge
  N --> E : t = maps the target node to an edge
  C <-- N : cN = maps the nodes to context
  C <-- E : cE = maps the edges to context
  class N{
    +the set of nodes in graph
  }
  class E{
    +the set of edges in graph
  }
  class C{
    +the set of all contexts
  }
```

- Creating markdown mermaid diagrams as pseudocode:

```mermaid
graph TD;
    node_root-->node_client
    node_client-->node_landing_page
    node_root-->node_server
    node_server-->node_auth_user_dir
    node_server-->node_models
    node_landing_page-->node_success_page
    node_success_page-->node_conversion_page
    node_conversion_page-->node_webcam_ai_chat
    node_user_profile_dashboard<-->node_webcam_ai_chat
    node_webcam_ai_chat-->node_training_data_collector
    node_models-->node_bi_enc
    node_models-->node_entity_extraction
    node_models-->node_embedding_cache
    node_models-->node_chat_state
    node_chat_state-->node_chat_state_1
    node_chat_state-->node_chat_state_2
    node_chat_state-->node_chat_state_3
    node_models-->node_faq_state
    node_faq_state-->node_faq_state_1
    node_faq_state-->node_faq_state_2
    node_faq_state-->node_faq_state_3
    node_auth_user_dir-->node_user_data_1
    node_auth_user_dir-->node_user_data_2
    node_auth_user_dir-->node_user_data_3
    node_user_profile_dashboard<-->node_auth_user_dir
```

```mermaid
journey
    title Landing page signup
    section Landing Page
        Hero section: 3: anon_visitor
        Call to Action: 4: anon_visitor
        Clicked cta Button: 5: anon_visitor
    section Success Page
        subscription payment: 5: auth_user
        create user profile: 5: auth_user
    section Conversion Page
        Payment confirmation: 5: auth_user
        Welcome section: 5: auth_user
```

```mermaid
---
title: Sign-up example
---
erDiagram
    ANON-VISITOR ||--o{ SIGN-UP : clicks-cta-button
    BETA-ACCESS-SIGN-UP ||--|{ BETA-ACCESS-LIFETIME-MEMBERSHIP : contains
    AUTHORIZED-USERS }|..|{ AI-PROFILE-AVATAR-GENERATOR-DASHBOARD : uses
    BETA-ACCESS-LIFEETIME-MEMBERSHIP }|..|{ AI-PROFILE-AVATAR-GENERATOR-DASHBOARD : uses
    BETA-ACCESS-LIFEETIME-MEMBERSHIP }|..|{ AI-ANIMAL-TRANSLATOR : enjoys
    AUTHORIZED-USERS }|..|{ AI-ANIMAL-TRANSLATOR : enjoys
```

## Building main.jac file

- Converting the pseudocode into Jac programming language:

```typescript
// import the graph and walker.
import {*} with "./chat_graph.jac";
import {*} with "./faq_graph.jac";
import {*} with "./walker.jac";

/// @notice this walker is reponsible for starting the program.
walker init {

    root {
        // creates an instance of the chat_graph
        spawn here ++> graph::chat_graph;

        // creates an instance of the faq_graph
        spawn here ++> graph::faq_graph;

        // creates an instance of the walker, talker
        spawn --> walker::talker;
    }
}
```

## Cyber-Security and AI Safety Monitoring

DIAT should be programmed to avoid any communication with all other AI Agents in any other languages or forms of communication other than english. DIAT _must only communicate in english with all other AI Agents,_ all other forms of communication will be programmed to be forbidden.

- Diligent monitoring of DIAT will ensure alignment.

```bash
sudo service redis-server restart
```

- Activating `.venv`

```bash
source .venv/bin/activate
```

- Training the bi-encoder model with the faq training data.

- Starting the Redis server

```bash
sudo service redis-server restart
```

```bash
actions load module jac_nlp.bi_enc
```

```bash
jac run bi_enc.jac -walk train -ctx '{"train_file": "chat_training_data.json"}'
```

```bash
jac run bi_enc.jac -walk infer -ctx "{\"labels\": [\"Doggy Decoder Landing Page\", \"Doggy Decoder Features and Benefits\", \"Doggy Decoder Webcam Translator\", \"Premium Beta Lifetime Membership Page\", \"Premium Beta Lifetime Membership Pricing Page\", \"Doggy Decoder Membership Page\", \"Doggy Decoder Membership Pricing Page\"]}"
```
