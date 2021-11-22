class StatGoldApi
  Integer @today = 0
  Integer @yesterday = 0
  Integer @this_month = 0
  Integer @last_month = 0
  Integer @plan_monthly_limit = 0

  # def initialize()
  # end

  attr_reader :today, :yesterday, :this_month, :last_month, :plan_monthly_limit
  attr_writer :today, :yesterday, :this_month, :last_month, :plan_monthly_limit

  def to_s
    puts" ------------------------------------------------------------"
    printf " | %-20s | %-10s \n" ,"Today:", @today
    printf " | %-20s | %-10s \n" ,"Yesterday:", @yesterday
    printf " | %-20s | %-10s \n" ,"This Month:", @this_month
    printf " | %-20s | %-10s \n" ,"Last Month:", @last_month
    printf " | %-20s | %-10s \n" ,"Plan Monthly Limit:", @plan_monthly_limit
   end
end