class BblogsController < ApplicationController
    before_action :set_bblog, only: %i[ show edit update destroy ]
    
    def index
        @bblogs = Bblog.all   
    end

    def show
        @posts = @bblog.posts
    end

    def new
        @bblog = Bblog.new
    end
    def create
        @bblog = Bblog.new(bblog_params) 
        authorize @bblog
        if @bblog.save
            redirect_to bblogs_url
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
    def bblog_params
      params.require(:bblog).permit(:title)
    end

    def set_bblog
        @bblog = Bblog.find(params[:id])
    end

end
