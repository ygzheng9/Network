var SelectVendor = React.createClass({

  getInitialState: function(){
     return {
       invited_vendors: this.props.invited_vendors,
       filter_input: "",
       filter_txt: "",
       current_status: 0 // 0: show invited vendors; 1: show filtered vendors
     };
  },

  // save filter to tmp variable, and only click "search" then apply the filter.
  filterChange: function (event) {
    this.setState({filter_input: event.target.value});
  },

  searchClicked: function (event) {
    new_status = 1;
    filter_txt = this.state.filter_input;
    this.setState({current_status: new_status, filter_txt: filter_txt});
  },

  backClicked: function (event) {
    new_status = 0;
    this.setState({current_status: new_status, filter_input: ""});
  },

  addClicked: function (item) {
    // console.log(item);

    invited_vendors = React.addons.update(this.state.invited_vendors, { $push: [item] });
    this.setState({invited_vendors: invited_vendors});
  },

  deleteClicked: function (item) {
    // console.log(item);

    index = this.state.invited_vendors.indexOf(item);
    invited_vendors = React.addons.update(this.state.invited_vendors, { $splice: [[index, 1]] })
    this.setState({invited_vendors: invited_vendors});
  },

  render: function() {
    // whether to show the "Back" button
    var back_btn;
    if (this.state.current_status == 1) {
      back_btn = <button className="btn btn-default" type="button" onClick={this.backClicked}>确定</button>
    }

    // filtered by code, name
    var filter_vendors = [];
    if (this.state.current_status == 1) {
      var filter_txt = this.state.filter_txt.toLowerCase();
      filter_vendors = this.props.all_vendors.filter(function(vendor) {
          cmp_code = vendor.code.search(filter_txt);
          cmp_name = vendor.name.search(filter_txt);
          cmp = cmp_code + cmp_name;
          return (cmp != -2);
      });
    }

    //
    invited_vendor_ids = _.pluck(this.state.invited_vendors, "id");
    console.log(invited_vendor_ids);

    return (
      <div>

      <div className="row">
        <div className="col-xs-4">
          <div className="input-group">
            <input type="text" className="form-control" placeholder="查找供应商..." onChange={this.filterChange} value={this.state.filter_input}></input>
            <span className="input-group-btn">
              <button className="btn btn-default" type="button" onClick={this.searchClicked}>查找</button>
              {back_btn}
            </span>
          </div>
        </div>
      </div>

      <div className="row">
        <div className={this.state.current_status == 1 ? "col-xs-4" : "hidden col-xs-4"}>
          <table className="table table-striped">
          <thead>
            <th>可选供应商</th>
            <th></th>
          </thead>
          <tbody>
            {
              filter_vendors.map(function(item, index) {

                var add_btn = <button type="button" className="btn btn-small btn-danger" key={index} onClick={this.addClicked.bind(this, item)}>添加</button>;

                // var idx = this.state.invited_vendors.indexOf(item);
                var idx = _.indexOf(invited_vendor_ids, item.id)
                if (idx >= 0) {
                  add_btn = <span className="glyphicon glyphicon-ok" aria-hidden="true"></span>
                }

                return (<tr>
                  <td>{item.code} - {item.name}</td>
                  <td>{add_btn}</td>
                </tr>)
              }, this)
            }
          </tbody>
          </table>
        </div>

        <div className="col-xs-4">
          <table className="table table-striped">
          <thead>
            <th>受邀供应商</th>
            <th></th>
          </thead>
          <tbody>
            {
              this.state.invited_vendors.map(function(item, index) {
                return (<tr>
                  <td>{item.code} - {item.name}</td>
                  <td><button type="button" className="btn btn-small btn-danger" key={index} onClick={this.deleteClicked.bind(this, item)}>删除</button></td>
                </tr>)
              }.bind(this))
            }
          </tbody>
          </table>
        </div>
      </div>
      </div>
    );
  }
});
