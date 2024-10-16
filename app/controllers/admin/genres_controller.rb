class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
end
