Stumplr.Collections.Blogs = Backbone.Collection.extend({
  model: TrelloClone.Models.Blog,
  url: 'blogs',

  getOrFetch: function (id) {
    var blog = this.get(id);

    if (!blog) {
      blog = new Stumplr.Models.Blog({ id: id });
      blog.fetch({
        success: function () {
          this.add(blog);
        }.bind(this)
      });
    } else {
      blog.fetch();
    }

    return blog;
  }
});

Stumplr.Collections.blogs = new Stumplr.Collections.Blogs
