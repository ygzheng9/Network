## 供应商协同平台

### 2015/08/11
1. gem 'bootstrap-sass', '~> 3.3.5'
    + application.css -> scss

    ```
    @import "bootstrap-sprockets";
    @import "bootstrap";
    @import "./**/*";
    ```

    + applicaiton.js

    ```
    //= require bootstrap-sprockets
    //= require turbolinks
    ```


2. gem 'react-rails'
    + application.js

    ```
    //= require turbolinks
    //= require react
    //= require react_ujs
    //= require components
    //= require_tree .
    ```

    + rails g react:install

    + config

    ```
    # config/environments/development.rb
    MyApp::Application.configure do
      config.react.variant = :development
      config.react.addons = true # defaults to false
    end

    # config/environments/production.rb
    MyApp::Application.configure do
      config.react.variant = :production
      config.react.addons = true # defaults to false
    end
    ```

3. gem 'simple_form'
    + rails generate simple_form:install
    + rails generate simple_form:install --bootstrap

4. RFx
rails g scaffold Sourcing_Org code:string desc:string
rails g scaffold Plant code:string desc:string
rails g scaffold Material code:string desc:string
rails g scaffold Rfx SN:string begin_dt:date end_dt:date sourcing_org_id:integer
rails g scaffold Rfx_item Rfx_id:integer plant_id:integer material_id:integer quantity:float required_dt:date

5. parent drop-down value

```
<%= f.association :sourcing_org, prompt: "请选择分组", label_method: :full_name, value_method: :id, include_blank: false %>
```

6. datepicker
    + gem 'bootstrap-datepicker-rails'

    + config

```
<%= f.input :begin_dt, as: :string, label: "开始日期", input_html: { readonly: true, class: :datepicker } %>

<script>
$('.datepicker').datepicker({
    format: "yyyy/mm/dd",
    autoclose: true,
    todayHighlight: true
});
</script>
```

7. better_error

```
  gem 'better_errors'
  gem "binding_of_caller"
```

8. rails: case sensitive, column name, table name

9. parent-child
    + nested resource,
    + [@parent, @child]

10. rails g scaffold vendor code name: string desc:string
    rails g model sourcing_type code name:string
    rails g scaffold rfx_round rfx_id:integer start_dt end_dt:date

11. react
    + {}.bind(this)
    + className, not class
    + js, html combination,
        + return (<tag></tag>) -- only one tag, and need ()
        + no ;
    + show/hide
        + partial rending: not recommend, case the dom is change.
            + render, partial = if (aa) {<div>babab<div>}
            + return {partial}

        + visible:

        ```
        <div className={this.state.selected_id == 1 ? "showing" : "hidden"}>
        <div className={this.state.current_status == 1 ? "col-xs-4" : "hidden col-xs-4"}>
        ```

    + input interaction

    ```
    selfChange: function (event) {
        this.setState({self_or_not: event.target.value});
    },
    ```
    + event with data --> bind(this, data)

    ```
            {
              filter_vendors.map(function(item, index) {
                return (<tr>
                  <td>{item.code} - {item.name}</td>
                  <td><button type="button" className="btn btn-small btn-danger" key={index} onClick={this.addClicked.bind(this, item)}>添加</button></td>
                </tr>)
              }, this)
            }
    ```

    + access child state

    ```
    console.log(this.refs.vendor_list.state.invited_vendors)
    <SelectVendor ref="vendor_list" all_vendors={this.props.all_vendors} />
    ```

12. gem "font-awesome-rails"

    rails g controller start_point index


### 2015/08/12
1. tab for route:  ajax partial render react_component ReactRailsUJS.mountComponents();
    1. tab link: rails ajax, remote: true, controller.action.

```
<%= link_to '选择寻源方式', select_sourcing_type_path(@rfx), remote: :true %>
```

    2. render js and in js,

```
// select_sourcing_type.js.erb  ==> from controller.select_sourcing_type
$('#rfx_detail_tabs').html("<%=j render "select_sourcing_type", rfx: @rfx, sourcing_types: @sourcing_types, all_vendors: @all_vendors %>");

ReactRailsUJS.mountComponents();

```
    3. in the template, using React

```
// _select_sourcing_type.html.erb
<%= react_component 'SourcingType', { rfx: rfx, sourcing_types: sourcing_types, all_vendors: all_vendors } %>
```

    4. only render view, how about logic in controller.action? how to pass data to view?
        + in ajax target url, controller.action.

1. bundle exec spring binstub --all


# 20150814
1.  rails g model rfx_sourcing_type rfx_id sourcing_type_id:integer is_self:integer is_invite:integer
    rails g model rfx_vendor rfx_id vendor_id:integer

    rails g controller rfx_sourcing_type create_update
    rails g controller rfx_vendor create_update

2.  _.pluck(objectList, "property")
    _.indexOf([], id)
    params.require(:rfx_vendors).permit(:rfx_id, :vendor_ids => []);
    batch_update_params[:vendor_ids];


3. add comment to everywhere.
    rails g resource comment comment_type:string ref_id:integer author:string comment:string

# 20150815
1. rails-assets-PACKAGE
2. web console    <% console %>


# 20150816
1. add function of alert-info --> suppose should still in [] when click x, however, no duplicate.

2. using unicorn for development
+ gem unicorn
+ unicorn_rails -p 3000         ---> default is -E development
+ tail -f log/development.log

# 20150818
1. edit multiple records at once  -- field_for
    + user
    + rfx_round