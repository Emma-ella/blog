class BblogsController < ApplicationController
    def index
        @bblogs = Bblog.all
        
    end
    def new
        @bblog = Bblog.new
        
    end
    def create
        @bblog = Bblog.new(bblog_params) 
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




end
