class EndUser::TagsController < ApplicationController
  before_action :authenticate_end_user!

  def search
	@content = params[:content]
	parks = Tag.search_parks_for(@content)
	@parks = Kaminari.paginate_array(parks).page(params[:page]).per(5)
	@admin_informations = AdminInformation.all
  end
end
