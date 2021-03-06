Stumplr.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/show'],
  quoteTemplate: JST['posts/quoteShow'],

  className: 'post-show',

  events: {
    "click a.post-delete": "destroyPost",
    "click a.post-edit": 'editPost'

  },

  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.collection, "new", this.closeModal);
    this.blog = options.blog;
  },

  render: function () {
    if (this.model.get('content_type') === "Quote") {
      var renderedContent = this.quoteTemplate({
        post: this.model
      });
    } else {
      var renderedContent = this.template({
        post: this.model
      });
    }

    this.$el.html(renderedContent);
    this.addLikeButton();
    this.addProfilePhoto();
    this.$(".post-pic").attr("src", this.model.get('filepicker_url'));
    return this;
  },

  destroyPost: function (event) {
    event.preventDefault();
    var that = this;
    this.model.destroy({
      success: function () {
        Stumplr.Collections.blogs.getOrFetch(that.blog.id).deletePost();
      }
    });
  },

  addLikeButton: function () {
    var view = new Stumplr.Views.LikeButtonView({
      model: this.model
    });
    this.addSubview('.panel-footer', view);
  },

  editPost: function (event) {
    event.preventDefault();
    var editFormView = new Stumplr.Views.PostForm({
      model: this.model,
      recipient: this.model.get('content_type'),
      collection: this.model.collection,
      blog: this.blog
    });
    this.$("#modal-form-wrapper").html(editFormView.render().$el);
  },

  addProfilePhoto: function () {
    if (this.model.get('blog_picture_url')) {
      this.$(".post-blog-image").attr("style", "width:75px;height:75px")
      this.$(".post-blog-image").attr("src", this.model.get('blog_picture_url'))
    }
  }

})
