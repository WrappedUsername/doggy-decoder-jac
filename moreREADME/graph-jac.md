# Building graph.jac file

- Converting the pseudocode into Jac programming language:

```Jac
node landing_page{
    has title;
    has hero_section;
    has call_to_action_button;
};
node success_page{
    has title;
    has hero_section;
    has call_to_action_button;
};
node conversion_page{
    has welcome_section;
    has user_dashboard_button;
};

edge anon_guest
edge authorized_user{
    has user_id;
};
edge lp_hero_section
edge lp_cta_button_clicked
edge sp_hero_section
edge sp_cta_button_clicked
edge cp_welcome_section
edge cp_user_dashboard_button

graph main_graph {
    has anchor main_root;
}
```
