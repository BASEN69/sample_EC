class Public::CarItemsController < ApplicationController
   before_action :authenticate_customer!
end
