ActiveAdmin.register Article do
require 'oembed'
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :body
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	index do 
		render partial: 'index'
	end
 

  show do |ad|
    attributes_table do
      row :title
      row :body do
        raw ad.body
      end
    end
    active_admin_comments
  end
# show do
# 	render partial: 'show'
# end

	form partial: 'new'
 	controller do
		def create
			url_regexp = /\b(http|https)/
			title = params[:user][:title];
			body = params[:user][:body];
    	body = body.split.collect{|string| string.split.grep(url_regexp).empty? ? string : "</br>"+OEmbed::Providers::Youtube.get(string).html rescue OEmbed::Providers::Instagram.get(string).html rescue string+"</br>"}.join(' ')
			@article = Article.new(title: title, body: body)
			@article.save
			respond_to do |format|
				format.json { render json: @article }
  		end
		end
	end
end
