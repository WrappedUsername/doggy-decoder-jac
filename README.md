# 🐶 Doggy Decoder, Digital Intelligence Animal Translator (DIAT) - Powered by [Jaseci](https://github.com/Jaseci-Labs/jaseci) and Jac - 🚧 Work In Progress 🏗

<p align="left">
<img src="https://komarev.com/ghpvc/?username=doggy-decoder-jac&label=Profile%20views&color=f79952&style=flat" alt="doggy-decoder-jac" />
<img alt="Stars" src="https://img.shields.io/github/stars/WrappedUsername/doggy-decoder-jac?style=flat-square&labelColor=343b41"/>
</p>

- DIAT, a voice-to-text, text-to-voice enabled, machine vision, image classifaction capable, customizable avatar AI, using a webcam module interface to interact with authorized users, and anon guests at sign up.
- The conversational AI Agent, will be used to interact with the human user, and provide value and helpful assistance throughout the user experience, beyond just providing animal translations.
- The machine vision and audio capable AI Agent will collect animal sounds and visual behaviour for mapping the relational training data.
- DIAT will be able to collect and train itself to translate any animal sounds (cats, dolphins, etc.) creating new training data, in order to translate all animal sounds (I just thought Doggy Decoder sounds cool, I also considered Parrot Pal).

## The structure of the app will be in the form of a graph

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
    node_conversion_page-->node_webcam_animal_translator
    node_user_profile_dashboard<-->node_webcam_animal_translator
    node_webcam_animal_translator-->node_training_data_collector
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

- Save the model

```bash
jac run bi_enc.jac -walk save_model -ctx '{"model_path": "dialogue_intent_model"}'
```

- Load the model

```bash
jac run bi_enc.jac -walk load_model -ctx '{"model_path": "dialogue_intent_model"}'
```

- Running the Chatbot Example

```bash
jac run main.jac
```
