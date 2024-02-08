class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to bblog_post_url(@post.bblog, @post)
    end


    def destroy
        p params
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to bblog_post_url(@post.bblog, @post), notice: 'Comment was successfully destroyed.'
    end


    private
    def comment_params
      params.require(:comment).permit(:content, :date)
    end




end
