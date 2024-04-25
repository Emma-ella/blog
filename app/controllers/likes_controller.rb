class LikesController < ApplicationController
    before_action :authenticate_user!
    def create 
        @bblog = Bblog.find(params[:bblog_id])
        @post= Post.find(params[:post_id])
        @comment = Comment.find(params[:comment_id])


        @like = @comment.likes.new(user_id: current_user.id, comment_id: params[:comment_id], post_id: params[:post_id], bblog_id: params[:bblog_id])
        @like.save!
        if @like.save
            redirect_to bblog_post_url(@bblog, @post), notice: "like added with success"
        else 
            redirect_to bblog_post_comments_path(@comment), alert: "errors when adding like"
        end

    end



    def destroy
        @like = Like.find(params[:id])
        @comment = @like.comment
        @bblog = @comment.post.bblog
        @post = @comment.post
        @like.destroy
        redirect_to bblog_post_url(@bblog, @post), notice: "like removed successfully"
    end


    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end

end
