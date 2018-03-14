module Blog
  class PostsController < ApplicationController
    # GET /posts
    # GET /posts.json
    def index
      if params[:tag].present?
         @posts = storage.most_recent.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 3)
      else
        @posts = storage.most_recent.paginate(:page => params[:page], :per_page => 3)
      end
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = storage.friendly.find(params[:id])
    end

    private

    def storage
      Post.published
    end
  end
end

