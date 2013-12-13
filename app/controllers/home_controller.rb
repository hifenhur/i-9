# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
	skip_before_filter :authenticate_user!, only:[:index]
  def index
  	@documents = Document.all.limit(5)
  end
end
