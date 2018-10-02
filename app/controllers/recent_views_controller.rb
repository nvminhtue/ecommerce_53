class RecentViewsController < ApplicationController
  before_action :load_recently, only: :recently
  def recently; end
end
