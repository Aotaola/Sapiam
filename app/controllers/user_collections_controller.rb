class UserCollectionsController < ApplicationController
    before_action :set_collection, only: [:show,  :destroy, :create, :new]
    before_action :set_user_collection, only: [:new, :create, :show]

    def show

    end
    def new

    end
    def create
        if @user_collection.save
            flash[:notice] = 'You have added this collection to your profile'
            redirect_back(fallback_location: root_path)
        else
            flash[:alert] = 'something went wrong'
            redirect_back(fallback_location: root_path)
        end
    end
    def destroy
        @user_collection = UserCollection.find(params[:id])
            if @user_collection.destroy
                flash[:notice] = "Successfully removed association."
                Rails.logger.info "Successfully destroyed UserCollection #{@user_collection.id}"
            else 
                flash[:alert] = "Failed to remove association."
                Rails.logger.warn "Failed to destroy UserCollection #{@user_collection.id}"
            end
        redirect_back(fallback_location: root_path)
    end

    private
   
    def set_collection
       @collection = Collection.find(params[:collection_id])
       Rails.logger.debug "@collection = #{@collection.inspect}"
    end
    def set_user_collection
        Rails.logger.debug "params[:collection_id] = #{params[:collection_id].inspect}"
        @user_collection = UserCollection.new(user: current_user, collection: @collection)
    end


end
