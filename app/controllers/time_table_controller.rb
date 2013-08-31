class TimeTableController < ApplicationController
	def update
		@time = TimeTable.find(params[:id])
		@time.update(time_table_params)
		redirect_to room_url(@time.room_id)
	end

private
	def time_table_params
		params.permit(	:Mon_b,:Mon_e,:Tue_b,:Tue_e,
						:Wen_b,:Wen_e,:Thu_b,:Thu_e,
						:Fri_b,:Fri_e,:Sat_b,:Sat_e,:Sun_b,:Sun_e
		)
	end
end
