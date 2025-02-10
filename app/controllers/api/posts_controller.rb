module Api
  class PostsController < BaseController
    before_action :set_post, only: [:show, :update, :destroy]
    
    def index
      @posts = Post.all
      render json: @posts
    end

    def show
      render json: @post
    end

    def create
      @community = Community.find(params[:community_id])
      @post = @community.posts.build(post_params)
      @post.user = User.first  # Temporary! We'll update this to use current_user after adding authentication

      if @post.save
        render json: @post, status: :created
      else
        render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
      head :no_content
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end 