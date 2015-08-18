var Comment = React.createClass({
  render: function () {
    return (
      <div className="comment">
        <h5 className="commentAuthor">
          {this.props.single_comment.author} - {this.props.single_comment.created_at}
        </h5>
          {this.props.single_comment.comment}
      </div>
      );
  }
});

var CommentList = React.createClass({
  render: function () {
    var commentNodes = this.props.comments.map(function (comment, index) {
      return (
        <Comment single_comment={comment} key={index} />
        );
    });

    return (
      <div className="commentList">
        {commentNodes}
      </div>
      );
  }
});

var CommentForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();

    var author = this.refs.author.getDOMNode().value.trim();
    var comment = this.refs.comment.getDOMNode().value.trim();

    this.props.onCommentSubmit({author: author, comment: comment});

    this.refs.author.getDOMNode().value = '';
    this.refs.comment.getDOMNode().value = '';
  },

  render: function() {
    return (
      <form className="" onSubmit={this.handleSubmit}>
        <div className="form-group">
          <input className="form-control" type="text" placeholder="尊姓大名" ref="author" />
          <textarea className="form-control" rows="3" placeholder="说些什么吧...." ref="comment" />
          <button type="submit" className="btn btn-default"> 给大伙看 </button>
        </div>
      </form>
      );
  }
});

var CommentBox = React.createClass({
  getInitialState: function () {
    return {
      all_comments: this.props.comments,
      is_shown: false
    };
  },

  handleCommentSubmit: function(params) {
    newComment = {
      comment_type: this.props.comment_type,
      ref_id: this.props.ref_id,
      author: params.author,
      comment: params.comment
    };

    // console.log(newComment);

    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: {comment: newComment},
      success: function(data) {
        // console.log(data);
        all_comments = React.addons.update(this.state.all_comments, { $push: [newComment] });
        this.setState({all_comments: all_comments});
        console.log("new comment saved!");
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  handleCtrlBtn: function() {
    new_status = !this.state.is_shown;

    this.setState({ is_shown: new_status });
  },

  render: function () {
    var btn_txt = '显示';
    var classes = 'hidden';

    if (this.state.is_shown) {
      btn_txt = '隐藏';
      classes = 'showing';
    }

    // var cx = React.addons.classSet;
    // var classes = cx({
    //   'showing': this.state.is_shown
    // });

    return (
      <div className="commentBox">
        <button className="btn btn-default" type="button" onClick={this.handleCtrlBtn}>{btn_txt}</button>
        <div className={classes}>
          <CommentList comments={this.state.all_comments} />
          <CommentForm onCommentSubmit={this.handleCommentSubmit}/>
        </div>
      </div>
      );
  }
});