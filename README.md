# Doggy Decoder, Digital Intelligence Animal Translator (DIAT) - Powered by [Jaseci](https://github.com/Jaseci-Labs/jaseci) and Jac - 🚧 Work In Progress 🏗

<p align="left">
<img src="https://komarev.com/ghpvc/?username=doggy-decoder-jac&label=Profile%20views&color=f79952&style=flat" alt="doggy-decoder-jac" />
<img alt="Stars" src="https://img.shields.io/github/stars/WrappedUsername/doggy-decoder-jac?style=flat-square&labelColor=343b41"/>
</p>

The structure of the app will be in the form of a graph.

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

- Converting that pseudocode into Jac programming language:

```Jac
node landing_page;
node success_page;
node conversion_page

edge anon_guest
edge authorized_user
edge user_id
edge lp_hero_section
edge lp_cta_button_clicked
edge sp_hero_section
edge sp_cta_button_clicked
edge cp_hero_section
edge cp_cta_button_clicked

walker create_app {
    root {
        spawn here ++> node::landing_page
    }
}
```
