class PostsController < ApplicationController
  before_action :set_bblog, except: %i[ show edit update destroy ]
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = @bblog.posts
    
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post= Post.find(params[:id])   
    @comment = @post.comments.build 
  end

  # GET bblogs/:bblog_id/posts/new
  def new
    @post = @bblog.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /bblogs/:bblog_id/posts or /posts.json
  def create
    @post = @bblog.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to bblog_post_url(@bblog, @post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to bblog_post_url(@post.bblog, @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    blog_id = @post.bblog_id
    @post.destroy

    respond_to do |format|
      format.html { redirect_to bblog_posts_url(bblog_id: blog_id), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def set_bblog
      @bblog = Bblog.find(params[:bblog_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :author_name, :published_at)
    end
end
