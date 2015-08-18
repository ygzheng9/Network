var ShowMessage = React.createClass({

  getDefaultProps: function() {
    // info, warning, danger
    return {level: "info"};
  },

  render: function () {
    // alert alert-warning alert-dismissible fade in
    var cls = 'alert alert-dismissible fade in alert-' + this.props.level;

    return (
      <div className={cls} role="alert">
        <button type="button" className="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">x</span></button>
        {this.props.message}
      </div>
    );
  }
});

var BatchMessages = React.createClass({
  render: function () {
    return (
      <div>
        {
          this.props.messages.map(function(msg, index) {
            return (<ShowMessage message={msg.message} level={msg.level} />);
          })
        }
      </div>
    );
  }
});