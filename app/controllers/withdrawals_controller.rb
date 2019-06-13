class WithdrawalsController < ApplicationController



    def index
    end
    def new
        @withdrawal = Withdrawal.new
    end

    def create
        @withdrawal_point = params[:withdrawal][:withdrawal_point].to_i
        @curPoint = current_user.point
        @errors = {} #=> {}
        if !BankAccount.find_by(user_id: current_user.id) && @curPoint < @withdrawal_point && @withdrawal_point < 500
   
            @withdrawal = Withdrawal.new(withdrawal_point: @withdrawal_point,user_id: current_user.id)
            @withdrawal.save
            current_user.point -= @withdrawal.withdrawal_point
            current_user.save
            redirect_to user_path(current_user)

        else
            if !BankAccount.find_by(user_id: current_user.id)
                @errors = {"no_account" => '口座の登録がありません'}
                end
                if @curPoint < @withdrawal_point
                @errors["lack_of_point"] = 'ポイントが足りません'
                end
                if @withdrawal_point < 500
                @errors["amount_error"] = '500ポイント以上引き出して下さい'
                end
                @withdrawal = Withdrawal.new
                render template: "withdrawals/new"
                
                
        end
        
    end
        

    end

    def show
        @withdrawal = Withdrawal.all
    end

    def destroy
        @withdrawal.destroy
        respond_to do |format|
          format.html { redirect_to user_path(current_user), notice: 'Bank account was successfully destroyed.' }
          format.json { head :no_content }
    end

end
