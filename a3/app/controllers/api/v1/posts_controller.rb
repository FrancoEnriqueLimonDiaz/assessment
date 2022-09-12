# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_api_v1_post, only: %i[show update destroy]
      require 'rqrcode'
      require 'chunky_png'

      # GET /api/v1/posts
      def index
        @data = []
        @files = ActiveStorage::Blob.all
        @files.each do |data|
          @data.push({ id: data.id, url: url_for(data) })
        end
        render json: @data, status: :ok
      end

      # GET /api/v1/posts/1
      def show
        render json: @api_v1_post
      end

      # POST /api/v1/posts
      def create
        @data = []
        @api_v1_posts = Api::V1::Post.new(api_v1_post_params)
        if @api_v1_posts.save
          @files = @api_v1_posts.images.all
          @files.each do |data|
            @data.push({ url: url_for(data) })
          end
          render json: @api_v1_posts, status: :created
        else
          render json: @api_v1_post.errors, status: :unprocessable_entity
        end
      end

      def render_xml
        @data = []
        @xml = []
        @get_selection = params[:id].to_i
        @files = ActiveStorage::Blob.all
        @files.each do |data|
          @data.push(url_for(data))
        end
        @files.count.times do |n|
          @svg = RQRCode::QRCode.new(@data[n].to_s).as_svg(
            color: '000',
            shape_rendering: 'crispEdges',
            module_size: 2,
            standalone: true,
            use_path: true,
            fill: 'ffffff'
          )
          @xml.push((@svg))
        end
        if @xml[@get_selection - 1].present?
          render xml: @xml[@get_selection - 1], status: :ok
        else
          render json: { message: 'You reach the limit.', limit: @xml.count }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/posts/1
      def update
        if @api_v1_post.update(api_v1_post_params)
          render json: @api_v1_post
        else
          render json: @api_v1_post.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_post
        @api_v1_post = Api::V1::Post.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def api_v1_post_params
        params.require(:api_v1_post).permit(:title, images: [])
      end
    end
  end
end
