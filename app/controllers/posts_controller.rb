class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]




	def index
		@posts = Post.all.order("created_at DESC")	
	end

	def show
		
	end


	def new
		@post = current_user.posts.new
	end


	def create
		@post = current_user.posts.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end


	def edit

	end


	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end


	end

	def destroy
		logger.debug "total comments for this post are: #{@post.comments.count}"
		@post.comments.each do |d|
			d.destroy
		end
		@post.destroy
		redirect_to root_path
	end




	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end


end
