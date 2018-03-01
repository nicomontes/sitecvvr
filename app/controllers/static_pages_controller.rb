class StaticPagesController < ApplicationController
  def utils
  end
  
  def notam
    system('export DISPLAY=:0 && ruby /home/nmontes/Code/notam/notam.rb')
    sleep 2
    redirect_to '/Notam.pdf'
  end
  
end
