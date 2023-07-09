class SourcesController < ApplicationController
    
    before_action :set_source, only: [:show, :edit, :update]

    def index
        @sources = Source.all
        @sources
    end
    def new
        @source = Source.new
    end
    def show 
        
    end
    def edit

    end
    def create
        @source = Source.create(source_params)
            if @source.save
                redirect_to @source,
                notice: "Source was successfully created"
            else
                redirect_to 'new'
                flash[:error] = "Something went wrong"
            end
    end

    def show 
        
    end
    def edit

    end
    def update
        if @source.update(source_params)
            notice "Source has been updated"
            redirect_to sources_path
        else
            flash[:error] = "Error updating source"
            render :edit
        end
    end
    def destroy
        @source.destroy
        redirect_to :user_path, notice: "Source has been deleted"
    end

    private 

    def set_source
        @source = Source.find(params[:id])
    end

    def source_params
        params.require(:source).permit(:link, :description)
    end
    
end
