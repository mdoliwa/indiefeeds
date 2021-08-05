class FeedsController < ApplicationController
  def index
    @websites = Website.all
  end
end
