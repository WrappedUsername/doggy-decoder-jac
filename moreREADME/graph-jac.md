# Building graph.jac file

- Converting the pseudocode into Jac programming language:

```Jac
node landing_page{
    has title;
    has hero_section;
    has call_to_action;
};
node success_page{
    has title;
    has hero_section;
    has call_to_action;
};
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

graph main_graph {
    has anchor main_root;
}
```
