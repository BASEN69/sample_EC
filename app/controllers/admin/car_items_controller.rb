class Admin::CarItemsController < ApplicationController
  before_action :authenticate_admin!
end
