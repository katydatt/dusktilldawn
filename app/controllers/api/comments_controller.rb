module Api

    class CommentsController < ApplicationController

      def index
        @comments = Comment.all
        render json: @comments.to_json, status: 201
      end

      def create
        comment = Comment.new
        comment.user_id = session[:user_id]
        comment.venue_id = params[:venue_id]
        comment.content = params[:content]
        comment.save
        # render json: comment.to_json, status: 201
        # raise comment.inspect
        user = User.find(session[:user_id])
        data = {comment: comment, user: user}
        render json: data.to_json, status: 201


      end

      def show
        comment = Comment.find(params[:id])
        render json: comment.to_json, status: 201
      end

      def update
        comment = Comment.find(params[:id])
        comment.user_id = params[:user_id]
        comment.venue_id = params[:venue_id]
        comment.content = params[:content]
        comment.save
        render json: comment.to_json, status: 201
      end

      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
      end

    end
end
