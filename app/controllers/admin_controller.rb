class AdminController < ApplicationController

    def new
    end

    def show
        @withdrawal = Withdrawal.all
        
    end


end
