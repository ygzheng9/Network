var SourcingType = React.createClass({
  getInitialState: function(){
    rfx_sourcing_type = this.props.rfx_sourcing_type;

    return {
      selected_id: rfx_sourcing_type.sourcing_type_id,
      self_or_not: rfx_sourcing_type.is_self,
      invite_or_not: rfx_sourcing_type.is_invite,
      messages: []
    };
  },

  selectType: function(e){
    this.setState({
      selected_id: e.target.id
    });
  },

  selfChange: function (event) {
    this.setState({self_or_not: event.target.value});
  },

  publicChange: function (event) {
    this.setState({invite_or_not: event.target.value});
  },

  saveClicked: function (event) {
    console.log("save clicked");
    console.log(this.refs.vendor_list.state.invited_vendors);

    rfx_sourcing_type = {
      rfx_id: this.props.rfx.id,
      sourcing_type_id: this.state.selected_id,
      is_self: this.state.self_or_not,
      is_invite: this.state.invite_or_not
    };

    $.ajax({
      method: 'POST',
      url: '/rfx_sourcing_type/create_update',
      dataType: 'JSON',
      data: { rfx_sourcing_type: rfx_sourcing_type },
      success: function(data) {
        console.log(data);
        console.log("sourcing type saved!");
      }.bind(this)
    });

    // batch update invited vendors
    vendor_ids = _.pluck(this.refs.vendor_list.state.invited_vendors, "id");
    rfx_vendors = {
      rfx_id: this.props.rfx.id,
      vendor_ids: vendor_ids
    };

    $.ajax({
      method: 'POST',
      url: '/rfx_vendor/create_update',
      dataType: 'JSON',
      data: { rfx_vendors: rfx_vendors },
      success: function(data) {
        // console.log(data);
        // console.log("vendors saved!");

        new_msg = {message: "保存成功"};
        messages = React.addons.update(this.state.messages, { $push: [new_msg] });
        this.setState({messages: messages});
      }.bind(this)
    });
  },

  render: function(){

    var search_vendor_class = "hidden row";
    if ( (this.state.selected_id == 1 && this.state.invite_or_not == 1) ||
         (this.state.selected_id == 3 || this.state.selected_id == 4) ) {
      search_vendor_class = "showing row";
    }

    var messages = this.state.messages.map(function(msg, index) {
      return (<ShowMessage message={msg.message} level={msg.level} />);
    });

    return (
      <div className="container-fluid">
      {messages}
      <div className="row">
          {
            this.props.sourcing_types.map(function(item, index) {
              var name = (this.state.selected_id == item.id) ? "btn btn-primary" : "btn btn-default"
              return <button className={name} type="button" id={item.id} key={index} onClick={this.selectType} >{item.name}</button>
            }.bind(this))
          }

      </div>

      <div className={this.state.selected_id == 1 ? "showing row" : "hidden row"}>
        <div className="col-xs-2">
          <div className="panel panel-default">
            <div className="panel-heading">类型</div>
            <div className="panel-body">
              <div className="radio">
                <label>
                  <input type="radio" name="self_or_not" id="optionsRadios1" onChange={this.selfChange} value="0" checked={this.state.self_or_not == 0}> </input>
                  委托招标
                </label>
              </div>
              <div className="radio">
                <label>
                  <input type="radio" name="self_or_not" id="optionsRadios2" onChange={this.selfChange} value="1" checked={this.state.self_or_not == 1}> </input>
                  自主招标
                </label>
              </div>
            </div>
          </div>
        </div>

        <div className="col-xs-2">
          <div className="panel panel-default">
            <div className="panel-heading">方式</div>
            <div className="panel-body">
              <div className="radio">
                <label>
                  <input type="radio" name="invite_or_not" id="optionsRadios3" onChange={this.publicChange} value="0" checked={this.state.invite_or_not == 0}> </input>
                  公开
                </label>
              </div>
              <div className="radio">
                <label>
                  <input type="radio" name="invite_or_not" id="optionsRadios4"
                      onChange={this.publicChange} value="1"
                      checked={this.state.invite_or_not == 1}> </input>
                  邀请
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className={search_vendor_class}>
          <SelectVendor
              ref="vendor_list"
              all_vendors={this.props.all_vendors}
              invited_vendors={this.props.invited_vendors} />
      </div>

      <div className="row">
        <div className="col-xs-offset-1 col-xs-4">
          <button className="btn btn-default" type="button" onClick={this.saveClicked} >确定</button>
        </div>
      </div>
      </div>
    );
  }
});